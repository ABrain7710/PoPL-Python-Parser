# Deliverable #1 tests (kindof)
# Arithmetic operators
a = 1 + 2
a = 1 - 2
a = 1 * 2
a = 1 / 2
a = 1 % 2
# Variable definitions
var_name = 1
varName = 1.1
_hiddenvar = .1
varname1 = True
otherVar = var_name
stringVar = "String"
aList = [1,2,3]
aMultiDimList = [['1','2','3'],['4','5','6'],['7','8','9']]
aTuple = (1,2,3)
aDict = {1:"wow", 2:"a", 3:"dict"}
aSet = {1,2,3}
callValue = sum(range(1,5))
indexedValue = aList[2]
# Assignment operators
b = 1
b += 2
b -= 2
b *= 2
b /= 2
aMultiDimList[0][0] = '-1'
aMultiDimList[1] = ['-4','-5','-6']
# Boolean assignments (conditionals)
c = a and b
c = a or b
c = not True
c = a == b
c = a <= b
c = a >= b
c = a != b
c = a < b
c = a > b
c = a is b
c = ((a and b) or (not (a < b))) or (a is b)



# Deliverable 2 tests (kindof)
# if/else blocks
if (a == b):
	indentedLine = 1

	anotherLine = 1
	if True:
		nestedIfs = 2
elif (a > b):
	itsAnElif = 2
else:
	itsAnElse = 3
if (a is b):
	pass
elif (a == b):
	itsAnElif = 2
elif (a < b):
	a += b - c / 3
else:
	itsAnElse = 3
# Conditional statments
if (a < b):
	pass
if (a <= b):
	pass
if (a > b):
	pass
if (a >= b):
	pass
if (a == b):
	pass
if (a != b):
	pass
if (a and b):
	pass
if (a or b):
	pass
if (not a):
	pass
if not a:
	pass
if a is b:
	pass




# Deliverable #3 tests (kind of)
# while and for loops
i = 1
while (i < 7):
	i += 1
i = 0
for item in aList:
	aList[i] = item + i
	i += 1
	for piece in aTuple:
		pass
# support for comments
# another comment among the dozen already tested


# Deliverable #4 tests (kind of)
def no_arg_func():
	print("Hello World")

def normal_arg_func(a, b, c):
	if a > b:
		c = a
	elif c > b:
		b = c
	else:
		b = a

	return c

def normal_and_default_arg_func(a, b, c=10, d="hello"):
	if a == 0 or b == 0:
		return

	while(a < b):
		
		a *= 3
		b *= 2

	return 

def default_arg_func(a="10", b=11):

	return a * b


def return_conditional_func(a, b):
	return a == b  


def function_as_default_arg(a=no_arg_func()):
	return a

# call function with no args
a = no_arg_func()

# call function with positional args
b = normal_arg_func("10", 11, 1.2)

# call function with keyword args
c = normal_and_default_arg_func(a="10", b=10)

# call function with positional and keyword args
d = defaul_arg_func(12, b=32)

# call function with expression
a = func(a=b+2)
a = func(b+2)

# call function in a function call
b = func(a=function_2(10, b=12))
b = func(function_2(10, b=12))


values = [[1,2,3], [1,2, [1, 2,3]]]
val_1 = values[0][0]
val_2 = values[1][2][1]

