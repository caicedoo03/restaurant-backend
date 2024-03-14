<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;



class Roles extends Model
{
    use HasApiTokens, HasFactory, Notifiable;

    protected $table = 'roles'; 
    protected $primaryKey = 'id_rol'; 

    public function employees(){
        return $this->hasMany(Employees::class, 'id_rol');
    
    }

    protected $fillable = [

        'id_rol', 
        'rol_name',
        'state',
        'created_user',
        'updated_user'
    ];
        

}