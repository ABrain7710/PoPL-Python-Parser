/**
 * A combined grammar to generate a parser and lexer for a simplified Python.
 * Written by: Andrew Brain, Noah Free, William Ohms, & Isaac Schroeder
 *
 */
grammar python;

parse : line* EOF ;

line
 : basic_line
 | indented_block
 ;

basic_line
 : assignment
 | NEWLINE
 ;

assignment : VAR_NAME ASSIGN expression NEWLINE ;

expression
 : OPEN_PAREN expression CLOSE_PAREN
 | SUBTRACT expression
 | expression MULTIPLICATION expression
 | expression DIVIDE expression
 | expression MODULUS expression
 | expression ADD expression
 | expression SUBTRACT expression
 | expression POWER expression
 | expression FLOOR_DIVIDE expression
 | BITWISE_NOT expression
 | expression BITWISE_AND expression
 | expression BITWISE_OR expression
 | expression BITWISE_XOR expression
 | expression BITWISE_LS expression
 | expression BITWISE_RS expression
 | atom
 ;

conditional
 : OPEN_PAREN conditional CLOSE_PAREN
 | NEGATE conditional
 | conditional COMPARE conditional
 | conditional LOGIC conditional
 | expression
 ;

atom
 : NUMBER
 | BOOLEAN
 | VAR_NAME
 | STRING
 | NONE
 ;

// If / Else Blocks

indented_block
 : if_statement indented_lines (elif_statement indented_lines)* (else_statement indented_lines)?
 | function indented_lines
 ;

indented_lines : (('\t' basic_line) | indented_block_2)+ ;

indented_block_2
 : '\t' if_statement indented_lines_2 ('\t' elif_statement indented_lines_2)* ('\t' else_statement indented_lines_2)?
 | '\t' function indented_lines_2
 ;

indented_lines_2 : (('\t\t' basic_line) | indented_block_3)+ ;

indented_block_3
 : '\t\t' if_statement indented_lines_3 ('\t\t' elif_statement indented_lines_3)* ('\t\t' else_statement indented_lines_3)?
 | '\t\t' function indented_lines_3
 ;

indented_lines_3 : (('\t\t\t') basic_line)+ ;

if_statement : IF conditional COLON NEWLINE ;

elif_statement : ELIF conditional COLON NEWLINE ;

else_statement : ELSE conditional COLON NEWLINE ;

// Support for Function Implementations

function
 : 'def' FUNC_NAME OPEN_PAREN (non_default_args ',' default_args) CLOSE_PAREN ':' NEWLINE
 | 'def' FUNC_NAME OPEN_PAREN (non_default_args) CLOSE_PAREN ':' NEWLINE
 | 'def' FUNC_NAME OPEN_PAREN (default_args) CLOSE_PAREN ':' NEWLINE
 | 'def' FUNC_NAME OPEN_PAREN CLOSE_PAREN ':' NEWLINE
 ;

default_args
 : VAR_NAME EQUALS atom ',' default_args
 | VAR_NAME EQUALS atom
 ;

non_default_args
 : VAR_NAME ',' non_default_args
 | VAR_NAME
 ;

COMPARE
 : '=='
 | '!='
 | '<='
 | '>='
 | '<'
 | '>'
 ;

LOGIC
 : 'and'
 | 'or'
 ;

NEGATE : 'not';

ASSIGN
 : EQUALS
 | '+='
 | '-='
 | '*='
 | '/='
 | '%='
 | '//='
 | '**='
 | '&='
 | '|='
 | '^='
 | '>>='
 | '<<='
 ;

EQUALS : '=';

ADD : '+';
SUBTRACT : '-';
POWER : '**';
MULTIPLICATION : '*';
FLOOR_DIVIDE : '//';
DIVIDE : '/';
MODULUS : '%';
BITWISE_NOT : '~';
BITWISE_AND : '&';
BITWISE_OR : '|';
BITWISE_XOR : '^';
BITWISE_LS : '<<';
BITWISE_RS : '>>';

OPEN_PAREN : '(';
CLOSE_PAREN : ')';

BOOLEAN
  : TRUE
  | FALSE
  ;

NUMBER
 : INT
 | FLOAT
 ;

// Match these keywords before VAR_NAME
TRUE : 'True' ;
FALSE : 'False' ;
NONE : 'None' ;

IF : 'if' ;

ELIF : 'elif' ;

ELSE : 'else' ;

VAR_NAME : ([a-zA-Z_] [a-zA-Z_0-9]*);

FUNC_NAME : [a-zA-Z_] [a-zA-Z_0-9]* ;

INT : [0-9]+ ;

FLOAT
 : [0-9]+ '.' [0-9]*
 | '.' [0-9]+
 ;

STRING
 : '"' (~["\r\n])* '"'
 | '\'' (~["\r\n])* '\''
 ;

COLON : ':' ;

SPACE : ' '+ -> skip ;

// Support for Comments

COMMENT : '#' .*? '\r'? '\n' -> skip ;

NEWLINE : '\r'? '\n' ;