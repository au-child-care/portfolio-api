<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Milestone extends Model
{

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'educator_id', 'child_id', 'age_group', 'developmental_area', 'observation', 'outcome_id', 'comments', 'date_tracked', 'published', 'deleted', 'date_created', 'date_modified'
    ];

    /**
     * The attributes excluded from the model's JSON form.
     *
     * @var array
     */
    protected $hidden = [ ];

    public $timestamps = false;
}