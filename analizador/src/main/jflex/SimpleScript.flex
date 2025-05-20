// Código de usuario
package org.example;

import java_cup.runtime.Symbol;

%%

// Opciones de JFlex
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

// Expresiones regulares
espacio = [ \t\r\n]+
entero = [0-9]+
decimal = {entero}"."{entero}
numero = {decimal}|{entero}
id = [a-zA-Z_][a-zA-Z0-9_]*
cadena = \"([^\"\\]|\\.)*\"

// Palabras clave
%%

{espacio}                       { /* ignorar */ }

"DEFINE"                        { return new Symbol(Sym.DEFINE); }
"PRINT"                         { return new Symbol(Sym.PRINT); }
"IF"                            { return new Symbol(Sym.IF); }
"ELSE"                          { return new Symbol(Sym.ELSE); }
"ELSEIF"                        { return new Symbol(Sym.ELSEIF); }
"WHILE"                         { return new Symbol(Sym.WHILE); }
"LOOP"                          { return new Symbol(Sym.LOOP); }
"FUNCTION"                      { return new Symbol(Sym.FUNCTION); }
"RETURN"                        { return new Symbol(Sym.RETURN); }
"END"                           { return new Symbol(Sym.END); }
"true"                          { return new Symbol(Sym.TRUE, true); }
"false"                         { return new Symbol(Sym.FALSE, false); }

// Operadores lógicos
"AND"                           { return new Symbol(Sym.AND); }
"OR"                            { return new Symbol(Sym.OR); }
"NOT"                           { return new Symbol(Sym.NOT); }

// Operadores aritméticos
"+"                             { return new Symbol(Sym.PLUS); }
"-"                             { return new Symbol(Sym.MINUS); }
"*"                             { return new Symbol(Sym.MULT); }
"/"                             { return new Symbol(Sym.DIV); }

// Operadores relacionales
"<="                            { return new Symbol(Sym.LEQ); }
">="                            { return new Symbol(Sym.GEQ); }
"=="                            { return new Symbol(Sym.EQ); }
"!="                            { return new Symbol(Sym.NEQ); }
"<"                             { return new Symbol(Sym.LT); }
">"

. {
    System.err.println("Error léxico: caracter no válido '" + yytext() + "' en línea " + (yyline + 1));
    return new Symbol(Sym.error);
}