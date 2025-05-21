package org.example;

import java_cup.runtime.*;
import org.example.sym;

%%

%class AnalizadorLexico
%unicode
%line
%column
%cup
%public

%{
    private Symbol symbol(int type) {
        return new Symbol(type, yyline, yycolumn, yytext());
    }
    
    private Symbol symbol(int type, Object value) {
        return new Symbol(type, yyline, yycolumn, value);
    }
    
    public int getLine() {
        return yyline + 1;
    }
%}

LineTerminator = \r|\n|\r\n
WhiteSpace = {LineTerminator} | [ \t\f]

/* Comentarios */
Comment = "//".* | "/*" ~"*/"

/* Literales */
IntegerLiteral = 0 | [1-9][0-9]*
FloatLiteral = [0-9]+ "." [0-9]+
BooleanLiteral = "true" | "false"
StringLiteral = \"([^\"\\]|\\.)*\"
Identifier = [a-zA-Z_][a-zA-Z0-9_]*

%%

<YYINITIAL> {
    /* Palabras clave */
    "DEFINE"       { return symbol(sym.DEFINE); }
    "PRINT"        { return symbol(sym.PRINT); }
    "IF"           { return symbol(sym.IF); }
    "ELSE"         { return symbol(sym.ELSE); }
    "ELSEIF"       { return symbol(sym.ELSEIF); }
    "WHILE"        { return symbol(sym.WHILE); }
    "LOOP"         { return symbol(sym.LOOP); }
    "FUNCTION"     { return symbol(sym.FUNCTION); }
    "RETURN"       { return symbol(sym.RETURN); }
    "END"          { return symbol(sym.END); }
    "DO"           { return symbol(sym.DO); }
    
    /* Operadores lógicos */
    "AND"          { return symbol(sym.AND); }
    "OR"           { return symbol(sym.OR); }
    "NOT"          { return symbol(sym.NOT); }
    
    /* Operadores aritméticos */
    "+"            { return symbol(sym.PLUS); }
    "-"            { return symbol(sym.MINUS); }
    "*"            { return symbol(sym.MULT); }
    "/"            { return symbol(sym.DIV); }
    
    /* Operadores relacionales */
    "<"            { return symbol(sym.LT); }
    ">"            { return symbol(sym.GT); }
    "<="           { return symbol(sym.LEQ); }
    ">="           { return symbol(sym.GEQ); }
    "=="           { return symbol(sym.EQ); }
    "!="           { return symbol(sym.NEQ); }
    
    /* Símbolos */
    "="            { return symbol(sym.ASSIGN); }
    ";"            { return symbol(sym.SEMI); }
    ","            { return symbol(sym.COMMA); }
    "("            { return symbol(sym.LPAREN); }
    ")"            { return symbol(sym.RPAREN); }
    
    /* Literales */
    {BooleanLiteral} { return symbol(sym.BOOLEAN, Boolean.valueOf(yytext())); }
    {IntegerLiteral} { return symbol(sym.ENTERO, new Integer(yytext())); }
    {FloatLiteral} { return symbol(sym.NUMERO, new Double(yytext())); }
    {StringLiteral}  { return symbol(sym.CADENA, yytext().substring(1, yytext().length()-1)); }
    {Identifier}     { return symbol(sym.ID, yytext()); }
    
    /* Espacios y comentarios */
    {WhiteSpace}   { /* Ignorar */ }
    {Comment}      { /* Ignorar */ }
}

[^] { throw new Error("Carácter ilegal <"+yytext()+"> en línea "+(yyline+1)); }