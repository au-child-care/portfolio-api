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
        'educator_id', 'child_id', 'title', 'details', 'target_outcome_id', 'target_date', 'done', 'deleted', 'date_created', 'date_modified'
    ];

    /**
     * The attributes excluded from the model's JSON form.
     *
     * @var array
     */
    protected $hidden = [ ];

    public $timestamps = false;
}