<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class Tables extends Authenticatable
{
    use HasFactory, Notifiable;

    protected $table = 'tables'; 
    protected $primaryKey = 'id_table'; 
    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'id_table', 
        'number', 
        'table_description', 
        'state', 
        'created_user',
        'updated_user'
    ];

}
