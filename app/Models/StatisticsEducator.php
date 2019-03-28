<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class StatisticsEducator extends Model
{

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'educator_id',
        'total_milestones',
        'total_observations',
        'total_observations_unpublished',
        'total_itps',
        'total_itps_open',
        'total_children',
        'total_milestones_physical',
        'total_milestones_social',
        'total_milestones_emotional',
        'total_milestones_cognitive',
        'total_milestones_Language',
        'total_milestones_seek_advice',
        'total_observation_outcome1',
        'total_observation_outcome2',
        'total_observation_outcome3',
        'total_observation_outcome4',
        'total_observation_outcome5',
        'last_update_mode',
        'date_modified'
    ];

    /**
     * The attributes excluded from the model's JSON form.
     *
     * @var array
     */
    protected $hidden = [ ];
    
    protected $table = 'stats_educators';

    protected $primaryKey = 'educator_id';

    public $timestamps = false;
}