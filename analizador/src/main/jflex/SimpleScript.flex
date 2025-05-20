package org.example;

import java_cup.runtime.Symbol;
import org.example.sym;

%%

%class AnalizadorLexico
%unicode
%cup
%public
%char
%line
%column

%{
    public Symbol getToken(int tipo, Object valor) {
        return new Symbol(tipo, yyline, yycolumn, valor);
    }

    public int getLine() {
        return yyline + 1;
    }
%}

espacio = [ \t\r\n]+
entero = [0-9]+
decimal = {entero}"."{entero}
numero = {decimal}|{entero}
id = [a-zA-Z_][a-zA-Z0-9_]*
cadena = \"([^\"\\]|\\.)*\"

// Palabras clave
%%

{espacio}                       { /* ignorar */ }

"DEFINE"                        { return new Symbol(sym.DEFINE); }
"PRINT"                         { return new Symbol(sym.PRINT); }
"IF"                            { return new Symbol(sym.IF); }
"ELSE"                          { return new Symbol(sym.ELSE); }
"ELSEIF"                        { return new Symbol(sym.ELSEIF); }
"WHILE"                         { return new Symbol(sym.WHILE); }
"LOOP"                          { return new Symbol(sym.LOOP); }
"FUNCTION"                      { return new Symbol(sym.FUNCTION); }
"RETURN"                        { return new Symbol(sym.RETURN); }
"END"                           { return new Symbol(sym.END); }
"true"                          { return new Symbol(sym.TRUE, true); }
"false"                         { return new Symbol(sym.FALSE, false); }

// Operadores lógicos
"AND"                           { return new Symbol(sym.AND); }
"OR"                            { return new Symbol(sym.OR); }
"NOT"                           { return new Symbol(sym.NOT); }

// Operadores aritméticos
"+"                             { return new Symbol(sym.PLUS); }
"-"                             { return new Symbol(sym.MINUS); }
"*"                             { return new Symbol(sym.MULT); }
"/"                             { return new Symbol(sym.DIV); }

// Operadores relacionales
"<="                            { return new Symbol(sym.LEQ); }
">="                            { return new Symbol(sym.GEQ); }
"=="                            { return new Symbol(sym.EQ); }
"!="                            { return new Symbol(sym.NEQ); }
"<"                             { return new Symbol(sym.LT); }
">"                             { return new Symbol(sym.GT); }

// Otros tokens
{cadena}                        { return new Symbol(sym.CADENA, yytext()); }
{id}                           { return new Symbol(sym.ID, yytext()); }
{numero}                       { return new Symbol(sym.NUMERO, Double.parseDouble(yytext())); }

// Ignorar espacios
{espacio}                      { /* Ignorar espacios y saltos de línea */ }

// Error léxico
. {
    System.err.println("Error léxico: caracter no válido '" + yytext() + "' en línea " + (yyline + 1));
    return new Symbol(sym.error);
}
