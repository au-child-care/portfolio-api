<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Administrator extends Model
{

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'centre_id', 'first_name', 'last_name', 'nickname', 'email', 'contact_number', 'password', 'active', 'deleted', 'date_created', 'date_modified'
    ];

    /**
     * The attributes excluded from the model's JSON form.
     *
     * @var array
     */
    protected $hidden = [ ];

    public $timestamps = false;
}