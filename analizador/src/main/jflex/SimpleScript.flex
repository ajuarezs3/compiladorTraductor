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

%%




"DEFINE"            { return new Symbol(sym.DEFINE); }
"PRINT"             { return new Symbol(sym.PRINT); }
"IF"                { return new Symbol(sym.IF); }
"ELSE"              { return new Symbol(sym.ELSE); }
"ELSEIF"            { return new Symbol(sym.ELSEIF); }
"WHILE"             { return new Symbol(sym.WHILE); }
"LOOP"              { return new Symbol(sym.LOOP); }
"FUNCTION"          { return new Symbol(sym.FUNCTION); }
"RETURN"            { return new Symbol(sym.RETURN); }
"END"               { return new Symbol(sym.END); }
"DO"                { return new Symbol(sym.DO); }

"AND"               { return new Symbol(sym.AND); }
"OR"                { return new Symbol(sym.OR); }
"NOT"               { return new Symbol(sym.NOT); }

"true"              { return new Symbol(sym.BOOLEAN, true); }
"false"             { return new Symbol(sym.BOOLEAN, false); }

"=="                { return new Symbol(sym.EQ); }
"!="                { return new Symbol(sym.NEQ); }
"<="                { return new Symbol(sym.LEQ); }
">="                { return new Symbol(sym.GEQ); }
"<"                 { return new Symbol(sym.LT); }
">"                 { return new Symbol(sym.GT); }

"+"                 { return new Symbol(sym.PLUS); }
"-"                 { return new Symbol(sym.MINUS); }
"*"                 { return new Symbol(sym.MULT); }
"/"                 { return new Symbol(sym.DIV); }

"="                 { return new Symbol(sym.ASSIGN); }
";"                 { return new Symbol(sym.SEMI); }
","                 { return new Symbol(sym.COMMA); }
"("                 { return new Symbol(sym.LPAREN); }
")"                 { return new Symbol(sym.RPAREN); }

[0-9]+              { return new Symbol(sym.ENTERO, Integer.parseInt(yytext())); }
[0-9]+"."[0-9]+     { return new Symbol(sym.NUMERO, Double.parseDouble(yytext())); }
\"([^\"\n]*)\"      { return new Symbol(sym.CADENA, yytext().substring(1, yytext().length() - 1)); }
[a-zA-Z_][a-zA-Z0-9_]* { return new Symbol(sym.ID, yytext()); }

[\t\r\n ]+          { /* ignorar espacios */ }
.                   { System.err.println("Carácter inválido: " + yytext()); return new Symbol(sym.error); }
