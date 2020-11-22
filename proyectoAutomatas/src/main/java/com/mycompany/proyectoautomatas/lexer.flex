package com.mycompany.proyectoautomatas;
import java.io.*;
import static compilador.tokens.*;
%%
%class lexer
%type token
%line
%column
D=[0-9]
L=[a-z A-Z]
CA= "\""[^*]~"\"" | "\"" + "\""
WHITE = [\t\r\n]
%{
public String lexeme;
analisisCodigo c = new analisisCodigo();
%}
%%
{WHITE} {/*Ignore*/}
<YYINITIAL> "+" {c.linea=yyline;lexeme=yytext();return MAS;}
<YYINITIAL> "==" {c.linea=yyline;lexeme=yytext();return IGUAL;}
<YYINITIAL> "-" {c.linea=yyline;lexeme=yytext();return MENOS;}
<YYINITIAL> "||" {c.linea=yyline;lexeme=yytext();return OR;}
<YYINITIAL> "&&" {c.linea=yyline;lexeme=yytext();return AND;}
<YYINITIAL> "{" {c.linea=yyline;lexeme=yytext();return DELIMITADOR;}
<YYINITIAL> "}" {c.linea=yyline;lexeme=yytext();return DELIMITADOR;}
<YYINITIAL> "(" {c.linea=yyline;lexeme=yytext();return DELIMITADOR;}
<YYINITIAL> ")" {c.linea=yyline;lexeme=yytext();return DELIMITADOR;}
<YYINITIAL> "/" {c.linea=yyline;lexeme=yytext();return ENTRE;}