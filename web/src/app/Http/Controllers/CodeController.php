<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Code;

class CodeController extends Controller
{
    public function dashboard()
    {
        return view('dashboard');
    }

    public function store(Request $request)
    {
        $request->validate([
            'content' => 'required|string',
        ]);

        dd($request->all());

        Code::create([
            'content' => $request->input('content'),
            'result' => null // You can later update this with Java output
        ]);

        return back()->with('success', 'Code submitted successfully.');
    }
}
