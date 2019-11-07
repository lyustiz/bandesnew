<?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable
{
    use Notifiable;

    protected $connection = 'auth';
    protected $table = 'usuario';
    protected $primaryKey = 'id_usuario';

    const CREATED_AT = 'fe_creado';
    const UPDATED_AT = 'fe_actualizado';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'nb_usuario', 'password', 'tx_email', 'username',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    public function roles()
    {
        return $this
            ->belongsToMany('App\Role')
            ->withTimestamps();
    }
}
