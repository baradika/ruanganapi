<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Pasien extends Model
{
    protected $table = 'pasiens';
    protected $fillable = [
        'NomorRekamMedis',
        'namaPasien',
        'tanggalLahir',
        'jenisKelamin',
        'alamatPasien',
        'kotaPasien',
        'usiaPasien',
        'penyakitPasien',
        'idDokter',
        'tanggalMasuk',
        'tanggalKeluar',
        'nomorKamar'
    ];
}
