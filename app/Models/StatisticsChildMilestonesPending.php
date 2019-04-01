<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class StatisticsChildMilestonesPending extends Model
{

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'child_id',
        'name',
        'current_group',
        'current_age_group',
        'pending_milestones',
        'total',
        'last_update_mode',
        'date_modified'
    ];

    /**
     * The attributes excluded from the model's JSON form.
     *
     * @var array
     */
    protected $hidden = [ ];
    
    protected $table = 'stats_children_milestones_pending';

    protected $primaryKey = 'child_id';

    public $timestamps = false;
}