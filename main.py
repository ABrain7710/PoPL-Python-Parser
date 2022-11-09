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
    tokens = CommonTokenStream(lexer)
    parser = pythonParser(tokens)
    tree = parser.parse()
    print(tree.toStringTree(recog=parser))


if __name__ == '__main__':
    main(sys.argv)
