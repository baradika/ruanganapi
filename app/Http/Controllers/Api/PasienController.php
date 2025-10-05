<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Pasien;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class PasienController extends Controller
{
    public function index()
    {
        $pasien = Pasien::all();
        return response()->json(['success' => true, 'data' => $pasien]);
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'NomorRekamMedis' => 'required|unique:pasiens',
            'namaPasien' => 'required',
            'tanggalLahir' => 'required|date',
            'jenisKelamin' => 'required|in:L,P',
            'alamatPasien' => 'required',
            'kotaPasien' => 'required',
            'usiaPasien' => 'required|integer',
            'penyakitPasien' => 'required',
            'idDokter' => 'required',
            'tanggalMasuk' => 'required|date'
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'message' => $validator->errors()], 422);
        }

        $pasien = Pasien::create($request->all());
        return response()->json(['success' => true, 'data' => $pasien], 201);
    }

    public function show($id)
    {
        $pasien = Pasien::find($id);
        if (!$pasien) {
            return response()->json(['success' => false, 'message' => 'Not found'], 404);
        }
        return response()->json(['success' => true, 'data' => $pasien]);
    }

    public function update(Request $request, $id)
    {
        $pasien = Pasien::find($id);
        if (!$pasien) {
            return response()->json(['success' => false, 'message' => 'Not found'], 404);
        }

        $validator = Validator::make($request->all(), [
            'NomorRekamMedis' => 'required|unique:pasiens,NomorRekamMedis,'.$id,
            'namaPasien' => 'required',
            'tanggalLahir' => 'required|date',
            'jenisKelamin' => 'required|in:L,P',
            'alamatPasien' => 'required',
            'kotaPasien' => 'required',
            'usiaPasien' => 'required|integer',
            'penyakitPasien' => 'required',
            'idDokter' => 'required',
            'tanggalMasuk' => 'required|date'
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'message' => $validator->errors()], 422);
        }

        $pasien->update($request->all());
        return response()->json(['success' => true, 'data' => $pasien]);
    }

    public function destroy($id)
    {
        $pasien = Pasien::find($id);
        if (!$pasien) {
            return response()->json(['success' => false, 'message' => 'Not found'], 404);
        }
        $pasien->delete();
        return response()->json(['success' => true, 'message' => 'Deleted successfully']);
    }
}
