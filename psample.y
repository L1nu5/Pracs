%{
#include <stdio.h>
#include <stdlib.h>
#include <omp.h>
#define YYSTYPE int
int expert = 2, nothreads = 4;
%}

%token INTEGER
%left '+' '-'
%left '*' '/'
%left '(' ')'

%pure-parser
%lex-param {void *scanner}
%parse-param {void *scanner}
%%

/*the productions applicable for calculator*/
printer: E {
			return $$;
	   }
E:
INTEGER	{ $$ = $1; }
|E'+'E  { $$ = $1 + $3;}
|E'-'E  { $$ = $1 - $3;}
|E'*'E  { $$ = $1 * $3;}
|E'/'E  { $$ = $1 / $3;} 
|'('E')'{ $$ = $2;}
;

%%

/*function executing concurrently*/
void solver()
{
	void *scanner;
	/*init and destroy needed in the program to begin and end*/
	yylex_init(&scanner); /*start*/	
	int tid, result, i, j;
	FILE *fh;
	fh = fopen("inputfile.txt","r");
	/*if file doesn't exist*/
	if(!fh)
	{
		printf("\nNo such file exists");
		exit(0);
	}
	/*placing 2 mathematical expressions on 1 thread; 4 such threads*/
	tid = omp_get_thread_num();
	char *buf = malloc(100); /*buffer accepting expression as string*/
	size_t siz = 100; /*size of buffer accepting expression as string*/
	for(i=0; i<(expert*tid); i++)
	{
		getline(&buf,&siz,fh);		
	}
	yyset_in(fh,scanner);
	for(j=0; j<expert; j++)
	{
		result = yyparse(scanner);
		printf("\nExpression = %d --> Thread = %d : Result = %d\n",(expert*tid+j+1),tid,result);
	}
	yylex_destroy(scanner); /*end*/
	fclose(fh);
}

/*main*/
void main()
{
	/*program for more expressions - concurrently*/
	printf("\n********** CALCULATOR **********\n");
	/*multithreading code*/
	#pragma omp parallel num_threads(nothreads)
	{
		solver();
	}
}

/*error function*/
int yyerror() 
{
	printf("\nInvalid!");
}
