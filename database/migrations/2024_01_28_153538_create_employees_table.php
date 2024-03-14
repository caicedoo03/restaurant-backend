<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('employees', function (Blueprint $table) {
            $table->id();
            $table->string('first_name');
            $table->string('last_name');
            $table->date('birthday');
            $table->string('phone');
            $table->string('photo');
            $table->string('postcode');
            $table->string('beneficiary');
            $table->string('account_number');
            $table->string('sort_code');
            $table->int('state');
            $table->string('email');
            $table->string('password');
            $table->date('created_at');
            $table->date('updated_at');
            //$table->timestamps(); /* save registration date */
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('employees');
    }
};
