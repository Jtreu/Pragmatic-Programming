%{

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
int charCount = 0; 
int wordCount = 0; 
int lineCount = 0;

%}

character [a-zA-Z]
digit [0-9]
word ({character}|{digit})+
line \n

%%

{line} { charCount++; lineCount++; }
{word} { wordCount++; charCount += strlen(yytext); }
. { charCount++; }

%%

// Jameson Treu
// Count the number of characters, words, and lines from an input file and output it to the terminal

int main(void) {
	yylex();
	system("clear");
    	printf("Number of characters: %d; ", charCount);
    	printf("\nNumber of words:      %d; ", wordCount);
    	printf("\nNumber of lines:      %d\n", lineCount);
	printf("\n");
    	return 0;
}