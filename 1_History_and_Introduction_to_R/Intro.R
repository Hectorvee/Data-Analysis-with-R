## R as a calculator

# We can use R as a calculator. For example, we can add two numbers:
2 + 3

# We can also subtract, multiply, and divide:
5 - 3
5 * 3
5 / 3

# We can also raise a number to a power:
5 ^ 3
5**3

# Some special operations:
# Integer division
5 %/% 3 # This will return 1 because 5 divided by 3 is 1 with a remainder of 2

# Euclidean division
5 %% 3 # This will return 2 because 5 divided by 3 is 1 with a remainder of 2

# Some special numerical constants:
Inf # Infinity
-Inf # Negative infinity
NaN # Not a number
NA # Missing value

# Build in character constants:
LETTERS # The uppercase alphabet
LETTERS[1:5] # The first five letters of the uppercase alphabet

letters # The lowercase alphabet
letters[1:5] # The first five letters of the lowercase alphabet

month.abb # The abbreviations of the months
month.abb[1:5] # The abbreviations of the first five months

month.name # The names of the months
month.name[1:5] # The names of the first five months

pi # The value of pi

# Imaginary numbers
sqrt(-1) # This will return NaN because the square root of a negative number is not a real number
sqrt(-1 + 0i) # This will return 0+1i because the square root of -1 is 0+1i

# Basic trigonometric functions
sin(pi/2) # This will return 1 because the sine of pi/2 is 1
cos(pi) # This will return -1 because the cosine of pi is -1
tan(pi/4) # This will return 1 because the tangent of pi/4 is 1
asin(1) # This will return pi/2 because the arcsine of 1 is pi/2
acos(-1) # This will return pi because the arccosine of -1 is pi
atan(1) # This will return pi/4 because the arctangent of 1 is pi/4

# Logarithmic functions
log(10) # This will return the natural logarithm of 10
log10(10) # This will return the base 10 logarithm of 10
log2(10) # This will return the base 2 logarithm of 10
exp(1) # This will return e because e raised to the power of 1 is e

## Your session
# Everything in R is in ram memory, so if you close RStudio, you will lose all your work.
# Fuctions to manage your session:
getwd() # Get the current working directory
setwd("path") # Set the working directory to "path"
dir() # List the files in the current working directory
ls() # List the objects in the current environment

install.packages("qtl") # Install a package
library("qtl") # Load a package

save("object", file = "object.RData") # Save an object to a file as a binary file
same.image() # Save the current session to a file
q() # Quit R

## Help is always available
# You can get help on any function by typing ?function_name or help(function_name)
?log
help(log)

# You can also get help on a package by typing ?package_name or help(package_name)
?base
help(base)

# You can search for help on a topic by typing ??topic or help.search("topic")
??"linear regression"
help.search("linear regression")



