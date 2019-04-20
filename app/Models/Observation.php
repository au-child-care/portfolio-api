<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Observation extends Model
{

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'educator_id', 'child_id', 'observation', 'outcome_id', 'assessment', 'follow_up', 'date_tracked', 'published', 'deleted', 'date_created', 'date_modified'
    ];

    /**
     * The attributes excluded from the model's JSON form.
     *
     * @var array
     */
    protected $hidden = [ ];

    public $timestamps = false;
}