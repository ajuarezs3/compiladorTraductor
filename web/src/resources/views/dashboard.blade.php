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
                            <label for="content" class="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-200">
                                Agregar SimpleScript code:
                            </label>

                            <textarea required name="content" id="content"
                                      rows="10"
                                      class="w-full rounded-md shadow-sm border-gray-300
                     focus:border-indigo-500 focus:ring focus:ring-indigo-200 focus:ring-opacity-50
                     dark:bg-gray-800 dark:text-white dark:border-gray-600 dark:placeholder-gray-400"
                                      placeholder="Ingresa acá el código ss">{{ old('content') }}</textarea>

                            <button type="submit"
                                    class="mt-4 px-4 py-2 bg-indigo-600 text-white font-semibold rounded-md shadow
                   hover:bg-indigo-700 transition
                   dark:bg-indigo-500 dark:hover:bg-indigo-400">
                                Enviar
                            </button>
                        </form>

                </div>
            </div>
        </div>
    </div>
</x-app-layout>
