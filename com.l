%{
	#include<stdio.h>
	#include<stdlib.h>
	void yyerror(char*);
	#include "com.tab.h"
%}

%%
"int"	{return INT;}
"float" {return FLOAT;}
"char" {return CHAR;}
"double" return DOUBLE;
"while" return WHILE;
"for" 	return FOR;
"if" 	return IF;
"else" return ELSE;	
"<="    return LE;
">="    return GE;
"=="    return EQ;
"!="    return NE;
">"		return GT;
"<"		return LT;
";" 	return SC;
"("		return OB;
")"		return CB;
"{"		return CBO;
"}"		return CBC;


[a-zA-Z]+ return VARIABLE;
[0-9]+ 	 return DIGIT;
[ \n]   { yylineno = yylineno + 1;}
[+-/=*] return *yytext;
[ \t\n]		;
.		return yytext[0];
%%

int yywrap(void){
	return 1;
}
