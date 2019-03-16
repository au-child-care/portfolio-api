<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class TeachingPlan extends Model
{

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'educator_id', 'child_id', 'details', 'target_outcome_id', 'target_date', 'published', 'deleted', 'date_created', 'date_modified'
    ];

    /**
     * The attributes excluded from the model's JSON form.
     *
     * @var array
     */
    protected $hidden = [ ];
}