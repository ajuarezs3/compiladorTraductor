package org.example;

import java.io.*;

public class Main {
    public static void main(String[] args) {
        try {
            System.out.println("Analizador léxico inicializado correctamente");

            Reader input = new FileReader("entrada.ss");

            AnalizadorLexico lexer = new AnalizadorLexico(input);
            parser parser = new parser(lexer);
            Object result = parser.parse().value;

            System.out.println("✅ Código válido");
        } catch (FileNotFoundException e) {
            System.err.println("❌ Archivo no encontrado: " + e.getMessage());
        } catch (IOException e) {
            System.err.println("❌ Error de entrada/salida: " + e.getMessage());
        } catch (Exception e) {
            System.err.println("❌ Error general de análisis:" + e.getMessage());

        }
    }

}
