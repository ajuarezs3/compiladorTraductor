package org.example;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.InputStreamReader;

import java_cup.runtime.Symbol;

public class Main {
    public static void main(String[] args) {
        try {
            BufferedReader reader = new BufferedReader(new FileReader(args[0]));
            AnalizadorLexico lexer = new AnalizadorLexico(reader);
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
