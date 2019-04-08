<?php
namespace App\Services;

use App\Utilities\WordUtilities;
use Phpml\Dataset\CsvDataset;
use Phpml\Dataset\ArrayDataset;
use Phpml\FeatureExtraction\TokenCountVectorizer;
use Phpml\Tokenization\WordTokenizer;
use Phpml\CrossValidation\StratifiedRandomSplit;
use Phpml\FeatureExtraction\TfIdfTransformer;
use Phpml\Metric\Accuracy;
use Phpml\Classification\NaiveBayes;
use Phpml\SupportVectorMachine\Kernel;

class ObservationClassifier {
    protected $wordUtilities;

    public function __construct()
    {
        $this->wordUtilities = new WordUtilities();
    }

    public function Classify($observation) {
        $dataset = new CsvDataset(__DIR__ . '../../../resources/datasets/observations.csv', 1);
        
        $samples = [];
        foreach ($dataset->getSamples() as $sample) {
            $samples[] = $this->wordUtilities->CleanupWords($sample[0]);
        }
        
        $vectorizer = new TokenCountVectorizer(new WordTokenizer());
        $vectorizer->fit($samples);
        $vectorizer->transform($samples);
        
        $tfIdfTransformer = new TfIdfTransformer($samples);
        $tfIdfTransformer->fit($samples);
        $tfIdfTransformer->transform($samples);
        
        $dataset = new ArrayDataset($samples, $dataset->getTargets());
        
        $classifier = new NaiveBayes();
        $classifier->train($samples, $dataset->getTargets());
        
        $observation = $this->wordUtilities->CleanupWords($observation);
        $testData = explode (' ', $observation);
        $vectorizer->fit($testData);
        $vectorizer->transform($testData);
        
        $predictedLabels = $classifier->predict($testData);

        $outcomesCounts = array_count_values($predictedLabels);
        $result = array(
            'recommendedOutcomeId' => $this->GetRecommendedObservation($outcomesCounts),
            'breakdown' => array(
                'unknownOutcome' => $this->GetObservationCount('0', $outcomesCounts),
                'outcome1' => $this->GetObservationCount('1', $outcomesCounts),
                'outcome2' => $this->GetObservationCount('2', $outcomesCounts),
                'outcome3' => $this->GetObservationCount('3', $outcomesCounts),
                'outcome4' => $this->GetObservationCount('4', $outcomesCounts),
                'outcome5' => $this->GetObservationCount('5', $outcomesCounts),
            )
        );

        $totalMatched = $result['breakdown']['outcome1'] +
            $result['breakdown']['outcome2'] + 
            $result['breakdown']['outcome3'] +
            $result['breakdown']['outcome4'] +
            $result['breakdown']['outcome5'];
        if ($totalMatched == 0) {
            $totalMatched = 1;
        } 

        $result['matchedPercentage'] = array(
            'outcome1' => round(($result['breakdown']['outcome1'] / $totalMatched) * 100, 2),
            'outcome2' => round(($result['breakdown']['outcome2'] / $totalMatched) * 100, 2),
            'outcome3' => round(($result['breakdown']['outcome3'] / $totalMatched) * 100, 2),
            'outcome4' => round(($result['breakdown']['outcome4'] / $totalMatched) * 100, 2),
            'outcome5' => round(($result['breakdown']['outcome5'] / $totalMatched) * 100, 2),
        );

        return $result;
    }

    function GetRecommendedObservation($outcomesCounts) {
        $mostMatched = '0';
        $lastMax = 0;
        foreach ($outcomesCounts as $key => $value) {
            if ($key != '0' && $value > $lastMax) {
                $mostMatched = $key;
                $lastMax = $value;
            }
        }

        return (int)$mostMatched;
    }

    function GetObservationCount($observationNumber, $outcomesCounts) {
        return array_key_exists($observationNumber, $outcomesCounts) ? $outcomesCounts[$observationNumber] : 0;
    }
}