%%

%class SimpleScriptLexer
%unicode
%cup
%public
%line
%column

// Palabras clave
DEFINE      = "DEFINE"
PRINT       = "PRINT"
IF          = "IF"
ELSE        = "ELSE"
ELSEIF      = "ELSEIF"
WHILE       = "WHILE"
LOOP        = "LOOP"
FUNCTION    = "FUNCTION"
RETURN      = "RETURN"
END         = "END"

// Otros tokens
NUMERO      = [0-9]+(\.[0-9]+)?
ID          = [a-zA-Z_][a-zA-Z0-9_]*
CADENA      = \"([^\\\"]|\\.)*\"

// Operadores
ESPACIO     = [ \t\r\n]+
COMENTARIO  = "//".*

%%

{DEFINE}    { return sym(Sym.DEFINE); }
{PRINT}     { return sym(Sym.PRINT); }
{IF}        { return sym(Sym.IF); }
// Agrega los demás tokens igual...

{NUMERO}    { return sym(Sym.NUMERO, Double.valueOf(yytext())); }
{CADENA}    { return sym(Sym.CADENA, yytext()); }
{ID}        { return sym(Sym.ID, yytext()); }

{ESPACIO}   { /* ignorar */ }
{COMENTARIO} { /* ignorar */ }

.           { System.err.println("Caracter inválido: " + yytext()); }
