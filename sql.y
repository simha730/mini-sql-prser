%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void yyerror(const char *s);
int yylex(void);
%}

%union {
    char* str;
    int num;
}

%token SELECT FROM WHERE
%token EQ
%token SEMICOLON
%token <str> IDENT
%token <num> NUMBER

%%
stmt:
      SELECT IDENT FROM IDENT WHERE IDENT EQ NUMBER SEMICOLON {
          printf("Parsed SQL Query:\n");
          printf("  SELECT %s FROM %s WHERE %s = %d\n",
                  $2, $4, $6, $8);
      }
    ;

%%
void yyerror(const char *s) {
    fprintf(stderr, "Parse error: %s\n", s);
}

