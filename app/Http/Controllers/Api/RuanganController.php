<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Ruangan;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class RuanganController extends Controller
{
    public function index()
    {
        $ruangan = Ruangan::all();
        return response()->json(['success' => true, 'data' => $ruangan]);
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'kodeRuangan' => 'required|unique:ruangan',
            'namaRuangan' => 'required',
            'dayaTampung' => 'required|integer',
            'lokasi' => 'required'
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'message' => $validator->errors()], 422);
        }

        $ruangan = Ruangan::create($request->all());
        return response()->json(['success' => true, 'data' => $ruangan], 201);
    }

    public function show($id)
    {
        $ruangan = Ruangan::find($id);
        if (!$ruangan) {
            return response()->json(['success' => false, 'message' => 'Not found'], 404);
        }
        return response()->json(['success' => true, 'data' => $ruangan]);
    }

    public function update(Request $request, $id)
    {
        $ruangan = Ruangan::find($id);
        if (!$ruangan) {
            return response()->json(['success' => false, 'message' => 'Not found'], 404);
        }

        $validator = Validator::make($request->all(), [
            'kodeRuangan' => 'required|unique:ruangan,kodeRuangan,'.$id,
            'namaRuangan' => 'required',
            'dayaTampung' => 'required|integer',
            'lokasi' => 'required'
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'message' => $validator->errors()], 422);
        }

        $ruangan->update($request->all());
        return response()->json(['success' => true, 'data' => $ruangan]);
    }

    public function destroy($id)
    {
        $ruangan = Ruangan::find($id);
        if (!$ruangan) {
            return response()->json(['success' => false, 'message' => 'Not found'], 404);
        }
        $ruangan->delete();
        return response()->json(['success' => true, 'message' => 'Deleted successfully']);
    }
}
