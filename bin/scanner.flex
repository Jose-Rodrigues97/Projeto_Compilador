package projetofinalcomp;

import static projetofinalcomp.Tokens*
import java_cup.runtime.Symbol
class sym{
    public static final int ID = =2;
    public static final int INTEIRO = 3;
    public static final int EOF = -1;
}

%%

%cup 
%class Lexer
%type Tokens
%debug
%char
%column
%full
%ignorecase
%line
%unicode
%eofval{
    return new Symbol(Tokens.EOF, new String("Fim do Arquivo."));
}
letra = [A-Za-z]
numero = [1-9]
caracter = [_]
ident = ( letra | caracter ) letra ( letra | numero | caracter )*

%%

{ ident }                                   { System.out.println("Reconhecimento: " + yytext()); return new Symbol(sym.ID, yytext(), yycolumn(), yyline()); }
","                                         { System.out.println("Reconhecimento: " + yytext()); return new Symbol(sym.VIRG, yytext(), yycolumn(), yyline()); }
";"                                         { System.out.println("Reconhecimento: " + yytext()); return new Symbol(sym.PTVIRG), yytext(), yycolumn(), yyline(); }
.                                           { System.out.println("Erro Lexico: " + yytext() + " Linha: " + yyline() + " Coluna: " + yycolumn()) }
\t | \r | \n | \f                           { System.out.println("Nada faz") }