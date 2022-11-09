import sys
from antlr4 import *
from pythonLexer import pythonLexer
from pythonParser import pythonParser

def main(argv):
    if len(sys.argv) > 1:
        program = FileStream(sys.argv[1])
    else:
        program = InputStream(sys.stdin.readline())

    lexer = pythonLexer(program)
    tokens = antlr4.CommonTokenStream(lexer)
    parser = antlr4.pythonParser(tokens)
    tree = parser.prog()
    print(tree.toStringTree(recog=parser))


if __name__ == '__main__':
    main(sys.argv)