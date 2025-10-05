<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Dokter extends Model
{
    protected $table = 'dokters';
    protected $fillable = [
        'idDokter',
        'namaDokter',
        'tanggalLahir',
        'spesialisasi',
        'lokasiPraktik',
        'jamPraktik'
    ];
}
