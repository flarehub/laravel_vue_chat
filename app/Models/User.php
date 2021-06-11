<?php

namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Fortify\TwoFactorAuthenticatable;
use Laravel\Jetstream\HasProfilePhoto;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
{
    use HasApiTokens;
    use HasFactory;
    use HasProfilePhoto;
    use Notifiable;
    use TwoFactorAuthenticatable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name',
        'email',
        'password',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password',
        'remember_token',
        'two_factor_recovery_codes',
        'two_factor_secret',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    /**
     * The accessors to append to the model's array form.
     *
     * @var array
     */
    protected $appends = [
        'profile_photo_url', 'msgCount'
    ];

    public function messages()
    {
        return $this->hasMany(Message::class);
    }

    public function getMsgCountAttribute() {
        return Message::where('user_id', $this->id)->where('read_status', 'N')->count();
    }

    public function unreadmessages() {
        return $this->messages()->where('receiver', $this->id)->where('read_status', 'N');
    }

    public static function getAllUsers()
    {
        // return User::select('Sum(messages)')->where('user.id', "!=", 1)->leftjoin('messages', 'messages.receiver_id', 'user.id')->where('messages.read_status', 'N')->get();
        return User::where('id', "!=", 1)->get();
    }
}
