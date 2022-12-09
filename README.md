# PoPl Parser Project
PROJECT DEMO: https://youtu.be/c7TUihtfeSs 

Group Name: **Python Python Parser Parsers**

### Team Members 
Andrew Brain
  
Isaac Shroeder

Wil Ohms

Noah Free

## Project Explanation 
### Overview
For this project, the four members of our group met twice a week for four weeks straight. In this time, we were able to get our development environments set up and complete the entirety of the lexer / parser itself. Our development consisted of the four of us using a *Replit* repository, which allowed each of us to edit the same document simultaneously. Therefore, instead of each of us making several commits to the GitHub repository, our GitHub commits came at the end of each week once we completed a milestone.

### Technical Details
Throughout our work on this project, we've created a file called *python.g4* which contains all of the necessary parser rules followed by the lexer tokens used in the parser in order to parse a Python-like language.
#### Tabs and Spaces
We decided to only allow our parser to work with tabs as opposed to spaces *or* tabs. Therefore, in our lexer we simply ignore any space that isn't in a string using *skip*. As far as tabs go, we have allowed for triple-nested blocks of any combination of if-statements, for loops, while loops, and functions. This is all done in the parser rules by using context-free grammar principles to ensure that the blocks contain the correct number of tabs.
#### Additional Rules
In addition to all of the expected features defined in the 'Parser Project Description' requirements document, we have allowed our parser to successfully parse many other aspects of Python. This includes the following:
- lists, tuples, sets, dictionaries
- indexing and nesting the above collection types
- `break` and `continue` statements
- `pass` and `is` keywords
- bitwise and floor division operators
- default arguments and keyword parameters


## Setup Steps/Environment Info
1. Ensure Java 1.7 or newer is installed.
2. Install Antlr4's Jar file for version 4.9.2. using the following link: https://www.antlr.org/download/antlr-4.9.2-complete.jar
3. Add the path to the Jar file to your CLASSPATH.
4. Create virtual environment using the command below. Replace <file_path> with where you would like your virtual environment to be stored:

     `python3 -m venv <file_path>`
   
5. Start the virtual environment. Replace <file_path> with where you would like your virtual environment to be stored:

     `source <file_path>`
   
6. Install the antlr4 python3 runtime environment using the command below

     `pip install antlr4-python3-runtime==4.9.2`
7. Install antlr4 tools using the command below

     `pip install antlr4-tools`
## How to Use/Run Parser
1. Change directory to the same location as the source code.
2. Run the following command:
   
     `antlr4 -Dlanguage=Python3 python.g4`
   
3. Run the python file with the name of the test file as a commmand line argument:
   
      Example: `python3 main.py test.py`

### Visualizer (EXTRA CREDIT)
1. Ensure that antlr4-tools is installed.
2. Run the following command:
   
`antlr4-parse python.g4 parse -gui test.py`

3. To run with other files, replace 'test.py' with the filepath desired.
