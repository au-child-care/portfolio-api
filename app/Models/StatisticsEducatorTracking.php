<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class StatisticsEducatorTracking extends Model
{

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'educator_id',
        'name',
        'groups_handled',
        'total_children',
        'total_children_seeking_advice',
        'total_children_milestones_missed',
        'total_children_observations_due',
        'total_milestones',
        'total_observations',
        'total_itps',
        'last_update_mode',
        'date_modified'
    ];

    /**
     * The attributes excluded from the model's JSON form.
     *
     * @var array
     */
    protected $hidden = [ ];
    
    protected $table = 'stats_educators_tracking';

    protected $primaryKey = 'educator_id';

    public $timestamps = false;
}