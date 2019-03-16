<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ParentGuardianAssignment extends Model
{

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'parentguardian_id', 'child_id'
    ];

    /**
     * The attributes excluded from the model's JSON form.
     *
     * @var array
     */
    protected $hidden = [ ];

    public $timestamps = false;
}