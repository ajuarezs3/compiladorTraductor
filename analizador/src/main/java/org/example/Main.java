package org.example;

import java.io.FileReader;
import java_cup.runtime.Symbol;

public class Main {
    public static void main(String[] args) {
        try {
            // Cambia "entrada.ss" por el nombre del archivo que quieras analizar
            FileReader archivo = new FileReader("entrada.ss");

            // Instancia del analizador léxico
            AnalizadorLexico lexer = new AnalizadorLexico(archivo);

            // Instancia del parser (CUP)
            parser parser = new parser(lexer);

            // Llamada al método parse() para procesar el archivo
            Symbol resultado = parser.parse();

            System.out.println("✅ El código es sintácticamente válido.");
        } catch (Exception e) {
            System.err.println("❌ Error durante el análisis:");
//            e.printStackTrace();
        }
    }
}
