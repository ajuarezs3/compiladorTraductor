<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use Illuminate\Http\Request;
use App\Models\Code;
use Symfony\Component\Process\Process;
use Illuminate\Support\Facades\Storage;

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

        $entradaPath = 'entrada';
        $logPath = 'log';

        if (!Storage::exists($entradaPath)) {
            Storage::makeDirectory($entradaPath);
        }

        if (!Storage::exists($logPath)) {
            Storage::makeDirectory($logPath);
        }

        $content = $request->input('content');
        $name = "entrada-".Carbon::now()->timestamp.".ss";

        $entradaPath = storage_path("app/entrada/$name");

        file_put_contents($entradaPath, $content);

        $jarPath = storage_path('app/analizador-1.0-SNAPSHOT.jar');
        $command = "java -jar \"$jarPath\" \"$entradaPath\"";
        $process = Process::fromShellCommandline($command);
        $process->run();

        $name = 'file-' . now()->format('Ymd-His') . '.log';

        $logPath = storage_path("app/log/$name");

        $result = $process->isSuccessful()
            ? $process->getOutput()
            : $process->getErrorOutput();



        file_put_contents($logPath, $result);
        $messages = $process->isSuccessful() ? "Codigo valido" : "Codigo Invalido";


        // 4. Guardar en la base de datos
         Code::create([
             'path_entrada' => $entradaPath,
             'path_log' => $logPath,
             'result' => $messages,
         ]);


        if ($process->isSuccessful()) {
            return back()->with('success', 'Codigo valido.');
        } else {
            return back()->with('error', 'Codigo Invalido');
        }
    }
}
