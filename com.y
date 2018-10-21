%{
    #include <stdio.h>
    #include <stdlib.h>
	void yyerror(char*);
	int yylex(void);
%}

%token INT FLOAT DOUBLE CHAR
%token  VARIABLE DIGIT
%token FOR IF ELSE WHILE
%token SC
%token OB CB
%token CBO CBC


%right '='
%left AND OR
%left '<' '>' LE GE EQ NE LT GT

%%


	
decleration : decleration Type assignment SC
			| decleration assignment SC
			| decleration statement
			|
			;
			
Type:
	 INT
	|CHAR
	|FLOAT
	|DOUBLE
	;
	
assignment :
			 VARIABLE '=' assignment	
			| VARIABLE '+' assignment
			| VARIABLE '-' assignment
			| VARIABLE '*' assignment
			| VARIABLE '/' assignment	
				
			| DIGIT '+' assignment
			| DIGIT '-' assignment
			| DIGIT '*' assignment
			| DIGIT '/' assignment
			
			|	VARIABLE
			|	DIGIT
		 	;


statement: WhileStmt
			|IfStmt
			|ForStmt
			;
		
	
WhileStmt: WHILE OB Expr CB CBO decleration CBC 	
		;
		
IfStmt: IF OB Expr CB assignment
		| IF OB Expr CB CBO decleration CBC
		| IF OB Expr CB CBO decleration CBC ELSE CBO decleration CBC
		;

ForStmt : FOR OB Expr SC Expr SC Expr CB assignment
		| FOR OB Expr SC Expr SC Expr CB CBO decleration CBC
		;
		
Expr: Expr LE Expr 
	| Expr GE Expr
	| Expr NE Expr
	| Expr EQ Expr
	| Expr GT Expr
	| Expr LT Expr
	| assignment
	|
	;



%%
void yyerror(char *s)
{
	fprintf(stderr,"%s\n",s);
	
}


int main()
{
	while(yyparse());
	return 0;
}