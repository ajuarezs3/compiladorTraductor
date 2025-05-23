package org.example;

import java.io.FileReader;
import java.io.InputStreamReader;

import java_cup.runtime.Symbol;

public class Main {
    public static void main(String[] args) {
        try {
            // Leer desde stdin (entrada estándar)
            AnalizadorLexico lexer = new AnalizadorLexico(new InputStreamReader(System.in));
            parser parser = new parser(lexer);
            Symbol resultado = parser.parse();

            System.out.println("El código es sintácticamente válido.");
            System.exit(0);
        } catch (Exception e) {
            System.err.println("Error de análisis: " + e.getMessage());
            System.exit(400);
        }
    }
}
