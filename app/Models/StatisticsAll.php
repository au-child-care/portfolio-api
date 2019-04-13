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
        'centre_id',
        'total_milestones',
        'total_observations',
        'total_itps',
        'total_itps_open',
        'total_parents_guardians',
        'total_parents',
        'total_guardians',
        'total_children',
        'total_babies',
        'total_senior_babies',
        'total_toddlers',
        'total_juniors',
        'total_kinders',
        'total_educators',
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

    protected $primaryKey = 'centre_id';

    public $timestamps = false;
}