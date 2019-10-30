# tdd_gameoflife_cmake
This repository is a demonstration of Test Driven Development (TDD) using cmake. CMake's syntax is very simple and limited. But it is possible to write tests and working code in it. The code here shows the implementation of Conway's game of life in CMake

## include
The tests are separated from the production code, but everything is bind together in the CMakeLists.txt file with the include command.  
https://cmake.org/cmake/help/latest/command/include.html

## Data
CMake has only two data types we can work on: lists and strings.  
https://cmake.org/cmake/help/latest/command/list.html  
https://cmake.org/cmake/help/latest/command/string.html  

if you want to set a value (`bar`) for a variable (`foo`), you can write:  
```set(foo bar)```  
We can also set a list of values to foo:  
```set(foo bar1 bar2 bar3)```    
https://cmake.org/cmake/help/latest/command/set.html 

## Expressions
Since there are no expressions in CMake we must use the math command to manipulate the strings we want.

```
set(number 5)
math(EXPR squared "${number}*${number}")
message("The square of ${number} is ${squared}")
#will print: The square of 5 is 25
```

https://cmake.org/cmake/help/latest/command/math.html

## Iterating through a list
```
set(sum 0)
foreach(item IN ITEMS 1 2 3 4 5)
    math(EXPR sum "${sum}+${item}")
endforeach()
message("The sum of numbers is: ${sum}")
```  
https://cmake.org/cmake/help/latest/command/foreach.html

## Functions
The functions in CMake are in fact commands which are changing the global or the local scope.

If you write a function, the only option to return a value from it is to give the function a name of the variable as a parameter.This name can then be used to set a value for the variable in the parent scope:

```
function(sum_of_values result)
    set(sum 0)
    foreach(item IN ITEMS ${ARGN})
        math(EXPR sum "${sum}+${item}")
    endforeach()
    set(${result} ${sum} PARENT_SCOPE)
endfunction()

sum_of_values(out 1 2 3 4 5)
message("The sum of values is: ${out}")
#will print:"The sum of values is:15"
```  
https://cmake.org/cmake/help/latest/command/function.html

## TDD 
Kudoz goes to @attilammagyar,  
I have followed his video from 2012 in which he does the same thing in python:  
https://www.youtube.com/watch?v=fkrpMLzxWOo

