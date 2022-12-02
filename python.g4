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
 : assignment NEWLINE
 | call NEWLINE
 | return_def NEWLINE
 | PASS NEWLINE
 | NEWLINE
 ;

assignment
 : IDENTIFIER ASSIGN expression
 | IDENTIFIER EQUALS expression
 ;

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
 | IDENTIFIER
 | STRING
 | NONE
 | list_def
 | tuple_def
 | dict_def
 | set_def
 | call
 | IDENTIFIER '[' expression ']'
 ;

list_def : '[' (atom (',' atom)*)? ']' ;

tuple_def : '(' (atom (',' atom)*)? ')' ;

dict_def : '{' (atom ':' atom (',' atom ':' atom)*)? '}' ;

set_def : '{' atom (',' atom)* '}' ;

// If / Else Blocks

indented_block
 : if_statement indented_lines (elif_statement indented_lines)* (else_statement indented_lines)?
 | function indented_lines
 | for_loop indented_lines
 | while_loop indented_lines (else_statement indented_lines)?
 ;

indented_lines : ((TAB basic_line) | indented_block_2 | ((TAB)* NEWLINE))+ ;

indented_block_2
 : TAB if_statement indented_lines_2 (TAB elif_statement indented_lines_2)* (TAB else_statement indented_lines_2)?
 | TAB function indented_lines_2
 | TAB for_loop indented_lines_2
 | TAB while_loop indented_lines_2 (TAB else_statement indented_lines_2)?
 ;

indented_lines_2 : ((TAB TAB basic_line) | indented_block_3 | (TAB TAB TAB NEWLINE))+ ;

indented_block_3
 : TAB TAB if_statement indented_lines_3 (TAB TAB elif_statement indented_lines_3)* (TAB TAB else_statement indented_lines_3)?
 | TAB TAB function indented_lines_3
 | TAB TAB for_loop indented_lines_3
 | TAB TAB while_loop indented_lines_3 (TAB TAB else_statement indented_lines_3)?
 ;

indented_lines_3 : ((TAB TAB TAB basic_line) | ((TAB)* NEWLINE))+ ;

if_statement : IF conditional COLON NEWLINE ;

elif_statement : ELIF conditional COLON NEWLINE ;

else_statement : ELSE conditional COLON NEWLINE ;


// function call
// variable name
// in place list
iterable
 : list_def
 | tuple_def
 | set_def
 | IDENTIFIER
 ;

// support for Loops
for_loop
 : FOR IDENTIFIER IN iterable ':' NEWLINE
 | FOR IDENTIFIER ',' IDENTIFIER IN (dict_def | IDENTIFIER) ':' NEWLINE
 ;

while_loop
 : WHILE conditional ':' NEWLINE
 ;

// Support for_loop Function Implementations

function
 : DEF IDENTIFIER OPEN_PAREN non_default_args ',' default_args CLOSE_PAREN ':' NEWLINE
 | DEF IDENTIFIER OPEN_PAREN non_default_args CLOSE_PAREN ':' NEWLINE
 | DEF IDENTIFIER OPEN_PAREN default_args CLOSE_PAREN ':' NEWLINE
 | DEF IDENTIFIER OPEN_PAREN CLOSE_PAREN ':' NEWLINE
 ;

return_def : RETURN expression;

call
 : IDENTIFIER OPEN_PAREN positional_args ',' keyword_args CLOSE_PAREN
 | IDENTIFIER OPEN_PAREN keyword_args CLOSE_PAREN
 | IDENTIFIER OPEN_PAREN positional_args CLOSE_PAREN
 | IDENTIFIER OPEN_PAREN CLOSE_PAREN
 ;

positional_args
 : (expression (',' expression)*)
 ;

keyword_args
 : (IDENTIFIER EQUALS expression (',' IDENTIFIER EQUALS expression)*)
 ;

default_args
 : IDENTIFIER EQUALS atom ',' default_args
 | IDENTIFIER EQUALS atom
 ;

non_default_args
 : IDENTIFIER ',' non_default_args
 | IDENTIFIER
 ;

COMPARE
 : '=='
 | '!='
 | '<='
 | '>='
 | '<'
 | '>'
 | IS
 ;

LOGIC
 : 'and'
 | 'or'
 ;

NEGATE : 'not';

ASSIGN
 : '+' EQUALS
 | '-' EQUALS
 | '*' EQUALS
 | '/' EQUALS
 | '%' EQUALS
 | '//' EQUALS
 | '**' EQUALS
 | '&' EQUALS
 | '|' EQUALS
 | '^' EQUALS
 | '>>' EQUALS
 | '<<' EQUALS
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

// Match these keywords before IDENTIFIER
TRUE : 'True' ;
FALSE : 'False' ;
NONE : 'None' ;

FOR : 'for' ;

IN : 'in' ;

IS : 'is' ;

WHILE : 'while' ;

IF : 'if' ;

ELIF : 'elif' ;

ELSE : 'else' ;

PASS : 'pass' ;

RETURN : 'return' ;

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

DEF : 'def' ;

TAB : '\t' ;

SPACE : ' '+ -> skip ;






// Catch these last three LAST

IDENTIFIER : ([a-zA-Z_] [a-zA-Z_0-9]*);

// Support for comments

COMMENT : '#' .*? '\r'? '\n' -> skip ;

NEWLINE : '\r'? '\n' ;
