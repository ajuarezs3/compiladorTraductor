<x-app-layout>
    <x-slot name="header">
        <h2 class="text-xl font-semibold leading-tight text-gray-800">
            Detalles del código #{{ $code->id }}
        </h2>
    </x-slot>
    <a href="{{ route('dashboard') }}"
       class="inline-block mt-6 px-4 py-2 bg-indigo-600 text-white rounded hover:bg-indigo-700">
        Volver
    </a>

    <div class="p-6">
        <h3 class="mt-6 mb-4 font-bold">Respuestas del compilador:</h3>
        @if ($code->path_log && $logContent)
            <h3 class="text-lg font-semibold mb-2">Resultado del análisis:</h3>
            <pre class="bg-gray-100 p-4 rounded text-sm overflow-x-auto">{{ $logContent }}</pre>
        @else
            <p class="text-gray-500">No hay respuestas registradas.</p>
        @endif

        @if ($code->path_entrada && $logEntrada)
            <h3 class="mb-4 font-bold">Código fuente:</h3>
            <pre class="bg-gray-100 p-4 rounded text-sm overflow-x-auto">{{ $logEntrada }}</pre>
        @else
            <p class="text-gray-500">No hay codigo fuente.</p>
        @endif



        <a href="{{ route('dashboard') }}"
           class="inline-block mt-6 px-4 py-2 bg-indigo-600 text-white rounded hover:bg-indigo-700">
            Volver
        </a>
    </div>
</x-app-layout>
