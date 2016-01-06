##
##********************************************************##
## CS 116 Assignment 6, Question 1                        ##
## Christopher Alert                                      ##
##                                                        ##
##(Determining whether or not a string qualifies as a SIN ##
## number)                                                ##
##                                                        ##
##                                                        ##
##********************************************************##

#
# Question 1
#
 
## str[nonempty] int-> int
## Consumes a string of a positive number,s, and an integer sum, and adds the 
## digits of the string together accumulatively to the integer sum, inputted.
## (usually sum would be zero initially to give the exact sum of the digits)
## Examples:
## sum_digits("123",0) => 6
## sum_digits("0",1) => 1
## sum_digits("1",1) => 0
## sum_digits("425675",0) => 29
def sum_digits(s,sum):
    if len(s)==0:
        return sum
    else:
        return sum_digits(s[1:],(sum+int(s[0])))

## Testing:
## sum_digits("123",0) => 6
print "Test 1" 
expected = 6 
ans = sum_digits("123",0) 
print ans==expected 
assert ans==expected

## sum_digits("0",1) => 1
print "Test 2" 
expected = 1 
ans = sum_digits("0",1) 
print ans==expected 
assert ans==expected

## sum_digits("425675",0) => 29
print "Test 3" 
expected = 29 
ans = sum_digits("425765",0) 
print ans==expected 
assert ans==expected

    
## is_valid_sin: str -> bool
## Consumes a string, sin, and produces True if the  nine numbers of the string 
## qualify to represent a SIN card number. 
## Examples: 
## is_valid_sin("203708490") => False
## is_valid_sin("124356874") => True
## is_valid_sin("123") => False
## is_valid_sin("124356877") => False
def is_valid_sin(sin):
    if not(len(sin) == 9):
        return False
        
    c2=  str(2 * int(sin[1]))
    c4=  str(2 * int(sin[3]))
    c6=  str(2 * int(sin[5]))
    c8=  str(2 * int(sin[7]))
    
    first_sum=sum_digits(c2,0)+sum_digits(c4,0)+sum_digits(c6,0)+sum_digits(c8,0)
    
    second_sum= int(sin[0]) + int(sin[2]) + int(sin[4]) + int(sin[6])
    total_sum= first_sum + second_sum
    
    if total_sum % 10 == 0:
        next_10= (total_sum / 10) * 10
    else:
        next_10= ((total_sum / 10) + 1) * 10
    check= next_10 - total_sum
    
    if check == int(sin[-1]):
        return True
    else:
        return False

## Testing:

## is_valid_sin("203708490") => True
print "Test 1" 
expected = True
ans = is_valid_sin("203708490")
print ans==expected 
assert ans==expected

## is_valid_sin("124356874") => True
print "Test 2" 
expected = True
ans = is_valid_sin("124356874")
print ans==expected 
assert ans==expected

## is_valid_sin("123") => False
print "Test 3" 
expected = False
ans = is_valid_sin("123")
print ans==expected 
assert ans==expected

## is_valid_sin("124356877") => False
print "Test 4" 
expected = False
ans = is_valid_sin("124356877")
print ans==expected 
assert ans==expected
    
