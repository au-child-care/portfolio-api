<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class StatisticsChildMilestonesMissed extends Model
{

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'child_id',
        'name',
        'group',
        'last_observation',
        'last_update_mode',
        'date_modified'
    ];

    /**
     * The attributes excluded from the model's JSON form.
     *
     * @var array
     */
    protected $hidden = [ ];
    
    protected $table = 'stats_children_observations_due';

    protected $primaryKey = 'child_id';

    public $timestamps = false;
}