package org.example;

import java.io.FileReader;
import java.io.Reader;
import java.io.IOException;

public class Main {
    public static void main(String[] args) {
        try {
            Reader input = new FileReader("input.txt");
            AnalizadorLexico lexer = new AnalizadorLexico(input);
            parser parser = new parser(lexer);
            Object result = parser.parse().value;
            System.out.println("✅ Código válido");
        } catch (FileNotFoundException e) {
            System.err.println("Archivo no encontrado: " + e.getMessage());
        } catch (IOException e) {
            System.err.println("Error de entrada/salida: " + e.getMessage());
        } catch (Exception e) {
            System.err.println("Error general de análisis:\n" + e.getMessage());
        }
    }
}
