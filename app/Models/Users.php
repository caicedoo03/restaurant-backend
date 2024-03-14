<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class Users extends Authenticatable
{
    use HasFactory, Notifiable;

    protected $table = 'users'; 
    protected $primaryKey = 'id_user'; 

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'id_user', 
        'first_name', 
        'last_name', 
        'email', 
        'birthday',
        'phone', 
        'state',
        'updated_user'
    ];

}
