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

"DEFINE"            { imprimirLexema(yytext(), yycolumn, yyline ); return getToken(sym.DEFINE, yytext()); }
"PRINT"             { imprimirLexema(yytext(), yycolumn, yyline ); return getToken(sym.PRINT, yytext()); }
"IF"                { imprimirLexema(yytext(), yycolumn, yyline ); return getToken(sym.IF, yytext());}
"ELSE"              { imprimirLexema(yytext(), yycolumn, yyline ); return getToken(sym.ELSE, yytext()); }
"ELSEIF"            { imprimirLexema(yytext(), yycolumn, yyline ); return getToken(sym.ELSEIF, yytext()); }
"WHILE"             { imprimirLexema(yytext(), yycolumn, yyline ); return getToken(sym.WHILE, yytext()); }
"LOOP"              { imprimirLexema(yytext(), yycolumn, yyline ); return getToken(sym.LOOP, yytext()); }
"FUNCTION"          { imprimirLexema(yytext(), yycolumn, yyline ); return getToken(sym.FUNCTION, yytext()); }
"RETURN"            { imprimirLexema(yytext(), yycolumn, yyline ); return getToken(sym.RETURN, yytext()); }
"END"               { imprimirLexema(yytext(), yycolumn, yyline ); return getToken(sym.END, yytext()); }
"DO"                { imprimirLexema(yytext(), yycolumn, yyline ); return getToken(sym.DO, yytext());}
"THEN"              { imprimirLexema(yytext(), yycolumn, yyline ); return getToken(sym.THEN, yytext()); }

"AND"               { imprimirLexema(yytext(), yycolumn, yyline ); return getToken(sym.AND, yytext()); }
"OR"                { imprimirLexema(yytext(), yycolumn, yyline ); return getToken(sym.OR, yytext());}
"NOT"               { imprimirLexema(yytext(), yycolumn, yyline ); return getToken(sym.NOT, yytext()); }

"true"              { imprimirLexema(yytext(), yycolumn, yyline ); return getToken(sym.BOOLEAN, true); }
"false"             { imprimirLexema(yytext(), yycolumn, yyline ); return getToken(sym.BOOLEAN, false); }

"=="                { imprimirLexema(yytext(), yycolumn, yyline ); return getToken(sym.EQ, yytext()); }
"!="                { imprimirLexema(yytext(), yycolumn, yyline ); return getToken(sym.NEQ, yytext()); }
"<="                { imprimirLexema(yytext(), yycolumn, yyline ); return getToken(sym.LEQ, yytext()); }
">="                { imprimirLexema(yytext(), yycolumn, yyline ); return getToken(sym.GEQ, yytext()); }
"<"                 { imprimirLexema(yytext(), yycolumn, yyline ); return getToken(sym.LT, yytext()); }
">"                 { imprimirLexema(yytext(), yycolumn, yyline ); return getToken(sym.GT, yytext()); }

"+"                 { imprimirLexema(yytext(), yycolumn, yyline ); return getToken(sym.PLUS, yytext()); }
"-"                 { imprimirLexema(yytext(), yycolumn, yyline ); return getToken(sym.MINUS, yytext()); }
"*"                 { imprimirLexema(yytext(), yycolumn, yyline ); return getToken(sym.MULT, yytext()); }
"/"                 { imprimirLexema(yytext(), yycolumn, yyline ); return getToken(sym.DIV, yytext()); }

"="                 { imprimirLexema(yytext(), yycolumn, yyline ); return getToken(sym.ASSIGN, yytext()); }
";"                 { imprimirLexema(yytext(), yycolumn, yyline ); return getToken(sym.SEMI, yytext()); }
","                 { imprimirLexema(yytext(), yycolumn, yyline ); return getToken(sym.COMMA, yytext()); }
"("                 { imprimirLexema(yytext(), yycolumn, yyline ); return getToken(sym.LPAREN, yytext()); }
")"                 { imprimirLexema(yytext(), yycolumn, yyline ); return getToken(sym.RPAREN, yytext()); }

[0-9]+              { imprimirLexema(yytext(), yycolumn, yyline ); return getToken(sym.ENTERO, Integer.parseInt(yytext())); }
[0-9]+\.[0-9]+      { imprimirLexema(yytext(), yycolumn, yyline ); return getToken(sym.NUMERO, Double.parseDouble(yytext())); }
\"([^\"\n]*)\"      { imprimirLexema(yytext(), yycolumn, yyline ); return getToken(sym.CADENA, yytext().substring(1, yytext().length() - 1)); }
[a-zA-Z_][a-zA-Z0-9_]* { imprimirLexema(yytext(), yycolumn, yyline ); return getToken(sym.ID, yytext()); }

[\s]+               { /* ignorar cualquier espacio o linea vacia */ }
.                   { System.err.println("Caracter invalido: " + yytext()); return getToken(sym.error, yytext()); }