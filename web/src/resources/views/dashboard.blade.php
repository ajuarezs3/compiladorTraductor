<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 dark:text-gray-200 leading-tight">
            {{ __('Enviar Codigo') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-12 lg:px-8">
            <div class="bg-white dark:bg-gray-800 overflow-hidden shadow-sm sm:rounded-lg">
                <div class="p-6 text-gray-900 dark:text-gray-100">
                    @if (session('success'))
                        <div style="color: green;">{{ session('success') }}</div>
                    @endif

                    <form action="{{ route('submit.code') }}" method="POST">
                        @csrf
                        <label for="content">Agregar SimpleScript code:</label><br><br>
                        <textarea name="content" id="content" rows="10" cols="100" placeholder="Write your code here...">{{ old('content') }}</textarea><br><br>
                        <button type="submit">Enviar</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</x-app-layout>
