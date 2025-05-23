package org.example;

import java.io.FileReader;
import java.io.InputStreamReader;

import java_cup.runtime.Symbol;

public class Main {
    public static void main(String[] args) {
        try {
            AnalizadorLexico lexer = new AnalizadorLexico(new InputStreamReader(System.in));
            parser parser = new parser(lexer);
            Symbol resultado = parser.parse();

            System.out.println("El codigo es sintacticamente valido.");
            System.exit(0);
        } catch (Exception e) {
            System.err.println("Error de analisis: " + e.getMessage());
            System.exit(400);
        }
    }
}
