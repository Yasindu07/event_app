<?php

use App\Http\Controllers\CustomerController;
use App\Http\Controllers\EventController;
use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});

Route::middleware([
    'auth:sanctum',
    config('jetstream.auth_session'),
    'verified',
])->group(function () {
    Route::get('/dashboard', function () {
        return view('dashboard');
    })->name('dashboard');
    Route::resource('events', EventController::class);
    Route::resource('customers', CustomerController::class);

    // Route::group(['prefix' => 'events'], function () {
    //     Route::get('/view', [EventController::class, 'index'])->name('events.view');
    //     Route::get('/show/{id}', [EventController::class, 'show'])->name('events.show');
    //     Route::get('/create', [EventController::class, 'create'])->name('events.create');  
    //     Route::post('/store', [EventController::class, 'store'])->name('events.store');     
    //     Route::get('/edit/{id}', [EventController::class, 'edit'])->name('events.edit');
    //     Route::put('/update', [EventController::class, 'update'])->name('events.update');
    //     Route::post('/delete/{id}', [EventController::class, 'destroy'])->name('events.destroy');
    //   });
});



