<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Code;
use Symfony\Component\Process\Process;

class CodeController extends Controller
{
    public function dashboard()
    {
        $inputs = Code::latest()->get();
        return view('dashboard',  compact('inputs'));
    }

    public function show($id)
    {
        $code = Code::with('responses')->findOrFail($id);
        return view('details', compact('code'));
    }

    public function store(Request $request)
    {
        // 1. Validación
        $request->validate([
            'content' => 'required|string',
        ]);

        $content = $request->input('content');

        if (strlen($content) > 50000) {
            return back()->with('error', 'El código ingresado es demasiado grande.');
        }

        $jarPath = storage_path('app/analizador-1.0-SNAPSHOT.jar');
        $process = Process::fromShellCommandline("java -jar \"$jarPath\"");
        $process->setInput($content);
        $process->run();

        // 3. Capturar el resultado
        $result = $process->isSuccessful()
            ? $process->getOutput()
            : $process->getErrorOutput();

        $messages = $process->isSuccessful() ? "Codigo valido" : "Codigo Invalido";

        $statusCode = $process->getExitCode();

        // 4. Guardar en la base de datos
        $code = Code::create([
            'content' => $content,
            'result' => $messages
        ]);

        foreach (explode("\n", $result) as $linea) {
            if (trim($linea)) {
                $code->responses()->create(['message' => $linea]);
            }
        }

        // 5. Redirigir con mensaje
        if ($process->isSuccessful()) {
            return back()->with('success', 'Codigo valido.');
        } else {
            return back()->with('error', 'Codigo Invalido');
        }
    }
}
