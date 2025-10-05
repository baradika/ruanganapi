<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Dokter;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class DokterController extends Controller
{
    public function index()
    {
        $dokter = Dokter::all();
        return response()->json(['success' => true, 'data' => $dokter]);
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'idDokter' => 'required|unique:dokters',
            'namaDokter' => 'required',
            'tanggalLahir' => 'required',
            'spesialisasi' => 'required',
            'lokasiPraktik' => 'required',
            'jamPraktik' => 'required'
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'message' => $validator->errors()], 422);
        }

        $dokter = Dokter::create($request->all());
        return response()->json(['success' => true, 'data' => $dokter], 201);
    }

    public function show($id)
    {
        $dokter = Dokter::find($id);
        if (!$dokter) {
            return response()->json(['success' => false, 'message' => 'Not found'], 404);
        }
        return response()->json(['success' => true, 'data' => $dokter]);
    }

    public function update(Request $request, $id)
    {
        $dokter = Dokter::find($id);
        if (!$dokter) {
            return response()->json(['success' => false, 'message' => 'Not found'], 404);
        }

        $validator = Validator::make($request->all(), [
            'idDokter' => 'required|unique:dokters,idDokter,'.$id,
            'namaDokter' => 'required',
            'tanggalLahir' => 'required',
            'spesialisasi' => 'required',
            'lokasiPraktik' => 'required',
            'jamPraktik' => 'required'
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'message' => $validator->errors()], 422);
        }

        $dokter->update($request->all());
        return response()->json(['success' => true, 'data' => $dokter]);
    }

    public function destroy($id)
    {
        $dokter = Dokter::find($id);
        if (!$dokter) {
            return response()->json(['success' => false, 'message' => 'Not found'], 404);
        }
        $dokter->delete();
        return response()->json(['success' => true, 'message' => 'Deleted successfully']);
    }
}
