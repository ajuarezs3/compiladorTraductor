<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void
    {
        Schema::create('codes', function (Blueprint $table) {
            $table->id();
            $table->longText('content');     // Código ingresado desde el textarea
            $table->text('result')->nullable();  // Resultado de validación del compilador Java
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('codes');
    }
};
