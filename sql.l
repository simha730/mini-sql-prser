%{
#include "sql.tab.h"
%}

%%
[ \t\r\n]+       ;
"SELECT"         return SELECT;
"FROM"           return FROM;
"WHERE"          return WHERE;
"="              return EQ;
";"              return SEMICOLON;

[a-zA-Z_][a-zA-Z0-9_]*   { yylval.str = strdup(yytext); return IDENT; }
[0-9]+                   { yylval.num = atoi(yytext);   return NUMBER; }

.              ;
%%
int yywrap() { return 1; }

