package org.example;

import java_cup.runtime.*;
import org.example.sym;

%%

%public
%class AnalizadorLexico
%unicode
%cup
%line
%column

%{
    public void imprimirLexema(String lexema, long columna, int linea) {
        System.out.println("Lexema:" + lexema +
                          " Columna: " + columna +
                          " Línea: " + linea);
    }

    public Symbol getToken(int tipo, Object valor) {
        return new Symbol(tipo, yyline, yycolumn, valor);
    }
%}

%%

"DEFINE"            { imprimirLexema(yytext(), yycolumn, yyline ); return new Symbol(sym.DEFINE, yytext()); }
"PRINT"             { imprimirLexema(yytext(), yycolumn, yyline ); return new Symbol(sym.PRINT, yytext()); }
"IF"                { imprimirLexema(yytext(), yycolumn, yyline ); return new Symbol(sym.IF, yytext());}
"ELSE"              { imprimirLexema(yytext(), yycolumn, yyline ); return new Symbol(sym.ELSE, yytext()); }
"ELSEIF"            { imprimirLexema(yytext(), yycolumn, yyline ); return new Symbol(sym.ELSEIF, yytext()); }
"WHILE"             { imprimirLexema(yytext(), yycolumn, yyline ); return new Symbol(sym.WHILE, yytext()); }
"LOOP"              { imprimirLexema(yytext(), yycolumn, yyline ); return new Symbol(sym.LOOP, yytext()); }
"FUNCTION"          { imprimirLexema(yytext(), yycolumn, yyline ); return new Symbol(sym.FUNCTION, yytext()); }
"RETURN"            { imprimirLexema(yytext(), yycolumn, yyline ); return new Symbol(sym.RETURN, yytext()); }
"END"               { imprimirLexema(yytext(), yycolumn, yyline ); return new Symbol(sym.END, yytext()); }
"DO"                { imprimirLexema(yytext(), yycolumn, yyline ); return new Symbol(sym.DO, yytext());}
"THEN"              { imprimirLexema(yytext(), yycolumn, yyline ); return new Symbol(sym.THEN, yytext()); }

"AND"               { imprimirLexema(yytext(), yycolumn, yyline ); return new Symbol(sym.AND, yytext()); }
"OR"                { imprimirLexema(yytext(), yycolumn, yyline ); return new Symbol(sym.OR, yytext());}
"NOT"               { imprimirLexema(yytext(), yycolumn, yyline ); return new Symbol(sym.NOT, yytext()); }

"true"              { imprimirLexema(yytext(), yycolumn, yyline ); return new Symbol(sym.BOOLEAN, true); }
"false"             { imprimirLexema(yytext(), yycolumn, yyline ); return new Symbol(sym.BOOLEAN, false); }

"=="                { imprimirLexema(yytext(), yycolumn, yyline ); return new Symbol(sym.EQ, yytext()); }
"!="                { imprimirLexema(yytext(), yycolumn, yyline ); return new Symbol(sym.NEQ, yytext()); }
"<="                { imprimirLexema(yytext(), yycolumn, yyline ); return new Symbol(sym.LEQ, yytext()); }
">="                { imprimirLexema(yytext(), yycolumn, yyline ); return new Symbol(sym.GEQ, yytext()); }
"<"                 { imprimirLexema(yytext(), yycolumn, yyline ); return new Symbol(sym.LT, yytext()); }
">"                 { imprimirLexema(yytext(), yycolumn, yyline ); return new Symbol(sym.GT, yytext()); }

"+"                 { imprimirLexema(yytext(), yycolumn, yyline ); return new Symbol(sym.PLUS, yytext()); }
"-"                 { imprimirLexema(yytext(), yycolumn, yyline ); return new Symbol(sym.MINUS, yytext()); }
"*"                 { imprimirLexema(yytext(), yycolumn, yyline ); return new Symbol(sym.MULT, yytext()); }
"/"                 { imprimirLexema(yytext(), yycolumn, yyline ); return new Symbol(sym.DIV, yytext()); }

"="                 { imprimirLexema(yytext(), yycolumn, yyline ); return new Symbol(sym.ASSIGN, yytext()); }
";"                 { imprimirLexema(yytext(), yycolumn, yyline ); return new Symbol(sym.SEMI, yytext()); }
","                 { imprimirLexema(yytext(), yycolumn, yyline ); return new Symbol(sym.COMMA, yytext()); }
"("                 { imprimirLexema(yytext(), yycolumn, yyline ); return new Symbol(sym.LPAREN, yytext()); }
")"                 { imprimirLexema(yytext(), yycolumn, yyline ); return new Symbol(sym.RPAREN, yytext()); }

[0-9]+              { imprimirLexema(yytext(), yycolumn, yyline ); return new Symbol(sym.ENTERO, Integer.parseInt(yytext())); }
[0-9]+\.[0-9]+      { imprimirLexema(yytext(), yycolumn, yyline ); return new Symbol(sym.NUMERO, Double.parseDouble(yytext())); }
\"([^\"\n]*)\"      { imprimirLexema(yytext(), yycolumn, yyline ); return new Symbol(sym.CADENA, yytext().substring(1, yytext().length() - 1)); }
[a-zA-Z_][a-zA-Z0-9_]* { imprimirLexema(yytext(), yycolumn, yyline ); return new Symbol(sym.ID, yytext()); }

[\s]+               { /* ignorar cualquier espacio o linea vacia */ }
.                   { System.err.println("Caracter invalido: " + yytext()); return new Symbol(sym.error,yytext()); }