<?php

use Illuminate\Foundation\Application;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;
use App\Models\User;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return Inertia::render('Welcome', [
        'canLogin' => Route::has('login'),
        'canRegister' => Route::has('register'),
        'laravelVersion' => Application::VERSION,
        'phpVersion' => PHP_VERSION,
    ]);
});

Route::get('/files', function () {
    return Inertia::render('Welcome', [
        'canLogin' => Route::has('login'),
        'canRegister' => Route::has('register'),
        'laravelVersion' => Application::VERSION,
        'phpVersion' => PHP_VERSION,
    ]);
});

Route::middleware(['auth:sanctum', 'verified'])->get('/dashboard', function () {
    return Inertia::render('Dashboard', [
        'user' => Auth::user(),
        'user_list' => User::getAllUsers()
    ]);
})->name('dashboard');

Route::middleware(['auth:sanctum', 'verified'])->get('/message-room', function () {
    return Inertia::render('AdminMessageRoom', [
        'user' => Auth::user(),
        'user_list' => User::getAllUsers()
]);
})->name('message-room');

Route::get('/user_list', function() {
    return User::getAllUsers();
});

// Route::get('/', 'ChatsController@index');
Route::get('/uploads/{filename}/{user_id}', 'App\Http\Controllers\ChatsController@getFile');
Route::get('messages', 'App\Http\Controllers\ChatsController@fetchMessages');
Route::post('messages', 'App\Http\Controllers\ChatsController@sendMessage');
Route::post('readMessage', 'App\Http\Controllers\ChatsController@readMessage');
