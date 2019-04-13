<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Centre extends Model
{

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'centre_code', 'name', 'address', 'contact_name', 'contact_email', 'contact_number', 'active', 'date_created', 'date_modified'
    ];

    /**
     * The attributes excluded from the model's JSON form.
     *
     * @var array
     */
    protected $hidden = [ ];

    public $timestamps = false;
}