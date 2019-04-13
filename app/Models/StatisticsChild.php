<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class StatisticsChild extends Model
{

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'child_id',
        'centre_id',
        'total_milestones',
        'total_observations',
        'total_itps',
        'total_itps_open',
        'total_milestones_physical',
        'total_milestones_social',
        'total_milestones_emotional',
        'total_milestones_cognitive',
        'total_milestones_language',
        'total_milestones_seek_advice',
        'total_observations_outcome1',
        'total_observations_outcome2',
        'total_observations_outcome3',
        'total_observations_outcome4',
        'total_observations_outcome5',
        'last_update_mode',
        'date_modified'
    ];

    /**
     * The attributes excluded from the model's JSON form.
     *
     * @var array
     */
    protected $hidden = [ ];
    
    protected $table = 'stats_children';

    protected $primaryKey = 'child_id';

    public $timestamps = false;
}