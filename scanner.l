/* CMSC 430 Compiler Theory and Design
   Project 1 Skeleton
   UMGC CITE, Summer 2023
   Robert Carswell
   1 January 2024 */

/* This file contains flex input file with the following changes
	1 - 8 identified below and modified the lexemes and operators.
	9 - 13 not listded because of comment errors but I Addedd integer 
	and real literals and updated comment, id, char, literals*/

%{
#include <cstdio>
#include <string>

using namespace std;

#include "listing.h"
#include "tokens.h"

%}


%option noyywrap

ws		[ \t\r]+
comment		"//""--".*\n 
line		[\n]
id		[A-Za-z](_{0,2}[A-Za-z0-9])*
digit		[0-9]
dec		{digit}+
char		('.'|'\\b'|'\\t'|'\\n'|'\\b'|'\\f')
punc		[\(\),:;]
integer		[?<=#][A-Fa-f0-9]([A-Fa-f0-9])
real	[0-9]*\.[0-9]+([Ee]([+-]?[0-9]+)?)?
%%

{ws}		{ ECHO; }
{comment}	{ ECHO; nextLine(); }
{line}		{ ECHO; nextLine(); }
"+"		{ ECHO; return(ADDOP); }
"*"		{ ECHO; return(MULOP); }
"&"		{ ECHO; return(ANDOP); }
"<"		{ ECHO; return(RELOP); }
"=>"		{ ECHO; return(ARROW); }
begin		{ ECHO; return(BEGIN_); }
case		{ ECHO; return(CASE); }
character	{ ECHO; return(CHARACTER); }
end		{ ECHO; return(END); }
endswitch	{ ECHO; return(ENDSWITCH); }
function	{ ECHO; return(FUNCTION); }
{integer}		{ ECHO; return(INTEGER); } //Updated
is		{ ECHO; return(IS); }
list		{ ECHO; return(LIST); }
of		{ ECHO; return(OF); }
others		{ ECHO; return(OTHERS); }
returns		{ ECHO; return(RETURNS); }
switch		{ ECHO; return(SWITCH); }
when		{ ECHO; return(WHEN); }

else		{ ECHO; return(ELSE); } //Added 1
elsif		{ ECHO; return(ELSIF);}  //Added 1
endfold	{ ECHO; return(ENDFOLD); } //Added 1
endif		{ ECHO; return(ENDIF); } //Added 1
fold		{ ECHO; return(FOLD); } //Added 1
if		{ ECHO; return(IF); } //Added 1
left		{ ECHO; return(LEFT); } //Added 1
{real}		{ ECHO; return(REAL); } //Added 1
right		{ ECHO; return(RIGHT); } //Added 1
then		{ ECHO; return(THEN); } //Added 1

"|"		{ ECHO; return(OROP); } //Added 2
"!"		{ ECHO; return(NOTOP); } //Added 2

"="		{ ECHO; return(RELOP); } //Added 3
"<>"		{ ECHO; return(RELOP); } //Added 3
">"		{ ECHO; return(RELOP); } //ADDED 3
">="		{ ECHO; return(RELOP); } //Added 3
"<="		{ ECHO; return(RELOP); } //Added 3

"-"		{ ECHO; return(ADDOP); } //Added 4

"/"		{ ECHO; return(MULOP); } //Added 5

"%"		{ ECHO; return(REMOP); } //Added 6

"^"		{ ECHO; return(EXPOP); } //Added 7

"~"		{ ECHO; return(NEGOP); } //Added 8

{id}		{ ECHO; return(IDENTIFIER);}
{dec}		{ ECHO; return(INT_LITERAL); }
{char}		{ ECHO; return(CHAR_LITERAL); }
{punc}		{ ECHO; return(yytext[0]); }
.		{ ECHO; appendError(LEXICAL, yytext); }
%%

int main() {
	firstLine();
	
	FILE *file = fopen("lexemes.txt", "wa"); 
	int token = yylex();
	while (token) {
		fprintf(file, "%d %s\n", token, yytext);
		token = yylex();
	}
	lastLine();
	fclose(file);
	return 0;
}