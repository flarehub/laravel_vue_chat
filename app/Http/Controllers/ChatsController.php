<?php

namespace App\Http\Controllers;

use App\Models\Message;
use App\Models\User;
use App\Events\MessageSent;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Mail;
use DB;

class ChatsController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        // $this->middleware('auth');
    }

    /**
     * Show chats
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('chat');
    }

    /**
     * Fetch all messages
     *
     * @return Message
     */
    public function fetchMessages(Request $request)
    {
        $messages = [];
        $user_id = $request->user_id;
        $receiver_id = $request->receiver_id;
        $messages = Message::select('*')
        ->where(
            function ($query) use ($user_id, $receiver_id) {
                $query->where('user_id', '=', $user_id)
                    ->Where('receiver', '=', $receiver_id);
            }
        )
        ->orWhere(
            function ($query) use ($user_id, $receiver_id) {
                $query->where('receiver', '=', $user_id)
                    ->Where('user_id', '=', $receiver_id);
            }
        )
        ->with('user')->get();
        
        return $messages;
    }

    /**
     * Persist message to database
     *
     * @param  Request $request
     * @return Response
     */
    public function sendMessage(Request $request)
    {
        $user = Auth::user();
        if(!empty($request->file) && $request->file != "undefined") {
            $fileName = time().'.'.$request->file->extension();  
            $request->file->move(public_path('uploads'), $fileName);
            $currentFileName = $request->file->getClientOriginalName();
            $currentFile     = "/uploads/".$fileName;
        }else
            $currentFile = $currentFileName = "";

        $message = $user->messages()->create([
            'message' => $request->input('message'),
            'receiver' => $request->receiver,
            'currentFileName' => $currentFileName,
            'currentFile' => $currentFile
        ]);

        broadcast(new MessageSent($user, $message))->toOthers();
        
        $admin = User::find(1);
        
        // send email notification
		// $data = [];
        // $data['messages']    = $request->message;
        // $data['user_name']   = $user->name;
        // $data['user_email']  = $user->email;
        // $data['admin_name']  = $admin->name;
        // $data['admin_email'] = $admin->email;
		
		// if($currentFile)
        // 	$data['attachment']  = public_path($currentFile);

        // Mail::send('mail_template.user', $data, function($message) use ($data) {
        //     $message->to($data['user_email'], 'Admin Support')->subject
        //         ('Support Notification');
            
        //     if(!empty($data['attachment']))
        //         $message->attach($data['attachment']);

        //     $message->from($data['admin_email'], $data['admin_name']);
        // });

        // Mail::send('mail_template.admin', $data, function($message) use ($data) {
        //     $message->to($data['admin_email'], 'Admin Support')->subject
        //         ('Support Notification');
            
        //     if(!empty($data['attachment']))
        //         $message->attach($data['attachment']);

        //     $message->from($data['admin_email'], $data['admin_name']);
        // });

        return ['status' => 'Message Sent!'];
    }

    public function readMessage(Request $request) 
    {
        $user = Auth::user();
        $receiver_id = $request->receiver;
        $messages = Message::where('receiver', $user->id)->where('user_id', $receiver_id)->update(['read_status' => 'Y']);
        
        if($messages) {
            return ['status' => true];
        } else
            return ['status' => false];
    }

    public function getFile(Request $request) 
    {
        $user = Auth::user();
        $message = Message::where('user_id', $request->user_id)->where('currentFileName', $request->filename)->latest('created_at')->first();
        if($message)
            return response()->download(public_path($message->currentFile), $message->currentFileName);
        else
            return back();
    }
}
