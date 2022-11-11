grammar python;

parse
 : line*
 ;

line
 : assignment
 | NEWLINE
 ;

assignment
 : VAR_NAME ASSIGN expression NEWLINE
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

atom
 : NUMBER
 | BOOLEAN
 | VAR_NAME
 | STRING
 | NONE
 ;


ASSIGN
 : '='
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
TRUE : 'True';
FALSE : 'False';
NONE : 'None';

VAR_NAME
 : [a-zA-Z_] [a-zA-Z_0-9]*
 ;

INT
 : [0-9]+
 ;

FLOAT
 : [0-9]+ '.' [0-9]*
 | '.' [0-9]+
 ;

STRING
 : '"' (~["\r\n])* '"'
 | '\'' (~["\r\n])* '\''
 ;

SPACE
 : [ \r]+ -> skip
 ;

NEWLINE : '\n' | EOF;