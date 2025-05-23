<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Code;
use Symfony\Component\Process\Process;

class CodeController extends Controller
{
    public function dashboard()
    {
        return view('dashboard');
    }

    public function store(Request $request)
    {
        // 1. Validación
        $request->validate([
            'content' => 'required|string',
        ]);

        $content = $request->input('content');

        $jarPath = storage_path('app/analizador-1.0-SNAPSHOT.jar');
        $process = Process::fromShellCommandline("java -jar \"$jarPath\"");
        $process->setInput($content);
        $process->run();

        // 3. Capturar el resultado
        $result = $process->isSuccessful()
            ? $process->getOutput()
            : $process->getErrorOutput();

        $statusCode = $process->getExitCode();

        // 4. Guardar en la base de datos
        Code::create([
            'content' => $content,
            'result' => $result
        ]);

        // 5. Redirigir con mensaje
        if ($process->isSuccessful()) {
            return back()->with('success', 'Codigo valido.');
        } else {
            return back()->with('error', 'Codigo Invalido');
        }
    }
}
