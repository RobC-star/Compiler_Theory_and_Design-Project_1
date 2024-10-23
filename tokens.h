// CMSC 430 Compiler Theory and Design
// Project 1 Skeleton
// UMGC CITE, Summer 2023
// Robert Carswell
// 1 January 2024 

// This file contains the enumerated type definition for tokens.
// Added new reserved words ELSE, ELSIF, ENDFOLD, ENDIF, FOLD, IF, 
// LEFT, REAL, RIGHT, THEN, OROP, NOTOP, REMOP, EXPOP, NEGOP

enum Tokens {ADDOP = 256, MULOP, ANDOP, RELOP, ARROW, BEGIN_, CASE, CHARACTER, END,
     ENDSWITCH, FUNCTION, INTEGER, IS, LIST, OF, OTHERS, RETURNS, SWITCH, WHEN,
     IDENTIFIER, INT_LITERAL, CHAR_LITERAL, ELSE, ELSIF, ENDFOLD, ENDIF, FOLD, IF,
     LEFT, REAL, RIGHT, THEN, OROP, NOTOP, REMOP, EXPOP, NEGOP};
