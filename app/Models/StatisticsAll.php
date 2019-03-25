<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class StatisticsAll extends Model
{

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'total_milestones',
        'total_observations',
        'total_itps',
        'total_itps_open',
        'total_parents_guardians',
        'total_parents',
        'total_guardians',
        'total_parents_guardians_babies',
        'total_parents_guardians_senior_babies',
        'total_parents_guardians_toddlers',
        'total_parents_guardians_juniors',
        'total_parents_guardians_kinders',
        'total_children',
        'total_babies',
        'total_senior_babies',
        'total_toddlers',
        'total_juniors',
        'total_kinders',
        'total_educators',
        'total_educators_babies',
        'total_educators_senior_babies',
        'total_educators_toddlers',
        'total_educators_juniors',
        'total_educators_kinders',
        'last_update_mode',
        'date_modified'
    ];

    /**
     * The attributes excluded from the model's JSON form.
     *
     * @var array
     */
    protected $hidden = [ ];
    
    protected $table = 'stats_all';

    public $timestamps = false;
}