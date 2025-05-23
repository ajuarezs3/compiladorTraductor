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

        // 2. Ejecutar el .jar con Java
        $process = Process::fromShellCommandline('java -jar /ruta/a/analizador.jar');
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
            return back()->with('success', 'Código válido. Resultado: ' . $result);
        } else {
            return back()->withErrors([
                'content' => 'Error de análisis: ' . $result,
            ])->withInput();
        }
    }
}
