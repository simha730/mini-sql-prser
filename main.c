#include <stdio.h>

int yyparse(void);

int main() {
    printf("Enter SQL query:\n");
    yyparse();
    return 0;
}

