<x-app-layout>
    <x-slot name="header">
        <h2 class="text-xl font-semibold leading-tight text-gray-800">
            Detalles del código #{{ $code->id }}
        </h2>
    </x-slot>

    <div class="p-6">
        <h3 class="mt-6 mb-4 font-bold">Respuestas del compilador:</h3>
        @if ($code->responses->isEmpty())
            <p class="text-gray-500">No hay respuestas registradas.</p>
        @else
            <ul class="list-disc pl-6">
                @foreach($code->responses as $response)
                    <li>{{ $response->message }}</li>
                @endforeach
            </ul>
        @endif

        <h3 class="mb-4 font-bold">Código fuente:</h3>
        <pre class="bg-gray-100 p-4 rounded">{{ $code->content }}</pre>



        <a href="{{ route('dashboard') }}"
           class="inline-block mt-6 px-4 py-2 bg-indigo-600 text-white rounded hover:bg-indigo-700">
            Volver
        </a>
    </div>
</x-app-layout>
