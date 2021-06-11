<?php

namespace App\models;

use Illuminate\Database\Eloquent\Model;

class Message extends Model
{
    /**
     * Fields that are mass assignable
     *
     * @var array
     */
    protected $fillable = ['user_id' ,'message', 'receiver', 'currentFile', 'currentFileName', 'read_status'];

    protected $appends  = ['chat_date', 'chat_time', 'user'];

    /**
     * A message belong to a user
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function user()
    {
        return $this->belongsTo(User::class);
    }
    
    public function getUserAttribute() {
        return User::find($this->user_id);
    }

    public function getChatDateAttribute() {
        return \Carbon\Carbon::createFromFormat('Y-m-d H:i:s', $this->created_at)->format('Y/m/d');
    }

    public function getChatTimeAttribute() {
        return \Carbon\Carbon::createFromFormat('Y-m-d H:i:s', $this->created_at)->format('H:i');
    }
}
