##
##********************************************************##
## CS 116 Assignment 6, Question 3                        ##
## Christopher Alert                                      ##
##                                                        ##
##(Creating a function that can estimate the n'th         ##
## fibonacci number)                                      ##
##                                                        ##
##                                                        ##
##********************************************************##

#
# Question 3
#

import math
import a6

## fib: int[<= 71] -> int
## Consumes an integer n, less than or equal to 71 and produces an accurate 
## n-th fibonacci number.
## number.
## Examples:
## fib(12) => 144
## fib(0) => 0
## fib(1) => 1
## fib(71) => a6.fib(71)
def fib(n):
    gold_ratio= (1 + math.sqrt(5))/ 2
    numerator=(math.pow(gold_ratio , n) - math.pow((1 - gold_ratio) , n))
    denom= math.sqrt(5)
    return int(numerator/denom)
## Testing:
print "Testing fib"

## fib(12) => 144
print "Test 1"
expected = a6.fib(12)
ans= fib(12)
print ans == expected
assert ans == expected

## fib(0) => 0
print "Test 2"
expected = a6.fib(0)
ans= fib(0)
print ans == expected
assert ans == expected

## fib(1)
print "Test 3"
expected = a6.fib(1)
ans= fib(1)
print ans == expected
assert ans == expected

## fib(71)
print "Test 4"
expected = a6.fib(71)
ans= fib(71)
print ans == expected
assert ans == expected


    
    
## how i found the limit.
## I refuse to do design recipe for a function not required.
## please don't take off marks =)
def find_accuracy_limit(n):
    return_val=n
    while (a6.fib(n) == fib(n) ):
        return_val= n
        n= n+1
    return return_val
        


    


