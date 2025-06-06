<?php

use App\Http\Controllers\CodeController;
use App\Http\Controllers\ProfileController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return redirect()->route('login');
});

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');

    Route::get('/dashboard', [CodeController::class, 'dashboard'])->name('dashboard');
    Route::get('/three', [CodeController::class, 'dashboard'])->name('three');
    Route::post('/submit-code', [CodeController::class, 'store'])->name('submit.code');
    Route::get('/code/{id}', [CodeController::class, 'show'])->name('code.show');
});

require __DIR__.'/auth.php';
