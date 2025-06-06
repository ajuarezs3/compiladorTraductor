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

                    @if (session('success') || session('error'))
                        <div class="mt-4 text-center">
                            @if (session('success'))
                                <div class="inline-block bg-green-100 border border-green-400 text-green-700 px-4 py-2 rounded">
                                    {{ session('success') }}
                                </div>
                            @endif

                            @if (session('error'))
                                <div class="inline-block bg-red-100 border border-red-400 text-red-700 px-4 py-2 rounded">
                                    {{ session('error') }}
                                </div>
                            @endif
                        </div>
                    @endif
                    <hr class="my-6">

                    <h2 class="text-lg font-semibold mb-4">Registros enviados</h2>

                    <div class="overflow-x-auto">
                        <table id="scripts-table" class="min-w-full border border-gray-300">
                            <thead class="bg-gray-100">
                            <tr>
                                <th class="px-4 py-2 border">ID</th>
                                <th class="px-4 py-2 border">Resultado</th>
                                <th class="px-4 py-2 border">Fecha</th>
                                <th class="px-4 py-2 border">Accion</th>
                            </tr>
                            </thead>
                            <tbody>
                            @foreach ($inputs as $input)
                                <tr>
                                    <td class="px-4 py-2 border">{{ $input->id }}</td>
                                    <td class="px-4 py-2 border whitespace-pre-wrap text-left text-sm text-gray-800">{{ $input->result }}</td>
                                    <td class="px-4 py-2 border">{{ $input->created_at->format('d/m/Y H:i') }}</td>
                                    <td  class="px-4 py-2 border">
                                        <a href="{{ route('code.show', $input->id) }}"
                                           class="px-3 py-1 bg-blue-600 text-white rounded hover:bg-blue-700 transition">
                                            Ver detalles
                                        </a>
                                    </td>
                                </tr>
                            @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
                </div>



        </div>


    </div>


    @push('scripts')
        <!-- jQuery (necesario para DataTables) -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

        <!-- DataTables -->
        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">
        <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>

        <script>
            $(document).ready(function () {
                $('#scripts-table').DataTable({
                    pageLength: 5,
                    order: [[0, 'desc']]
                });
            });
        </script>
    @endpush


</x-app-layout>
