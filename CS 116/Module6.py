## Question 1
## http://www.albinoblacksheep.com/flash/mind
## Write a function mindread, which consumes an 
## integer, num, between 10 and 99, and produces 
## num - the sum of its digits.

def mindread(num):
    n=str(num)
    s= 0
    for ind in range(0,len(n)):
        s += int(n[ind])
    return s

## Question 2
## Write a Python function ticket_prices which calculates the
## total cost for a group of movie tickets. The function consumes
## the movie time ("matinee" vs "evening") as well as the 
## number of child, adult, and seniors tickets being bought.
## For an evening movie, an adult ticket costs 11.95. Seniors
## receive a $2 discount, and children receive a $4 discount, per 
## ticket. All tickets at a matinee cost $5 each.
## There is also a service charge for buying on-line:
## $1 per ticket, if less than 4 tickets are bought, or
## $4 total if 4 or more are bought.
## example: ticket_price("evening", 0,1,0) => 12.95
## example: ticket_price("matinee", 5,2,1) => 44.00

def ticket_prices(time,c,a,s):
    pass
## Question 3
## Consider the sequence, start with a positive integer n, 
## if n is odd, calculate 3*n+1
## if n is even, calculate n/2
## continue until n=1
## Collatz conjecture: 1 will be reached for all positive numbers.
## Unproven, but all numbers < 1,000,000,000 converge within 1000 steps
## Write a Python function converges that consumes
## a positive integer n and a limit max_steps, and produces
## True if the Collatz conjecture holds for n within max_steps.

def collatz(n, max_steps):
    if n > 1 and max_steps > 0:
        if n % 2 != 0:
            return collatz(3*n +1, max_steps -1)
        else:
            return collatz(n/2, max_steps -1)
    elif n == 1:
        return True
    elif max_steps == 0:
        return False
    
## Question 4:
## Write a Python function check_password which consumes a string and a 
## natural number. The function then repeatedly asks the user to input their
## password, until it matches the consumed string or until the user has made
## N incorrect guesses, where N is the consumed number.

def check_password(pw,most_tries):
    user_input = raw_input("Enter your password:")
    if most_tries > 0:
        if user_input != pw:
            return check_password(pw,most_tries-1)
        if user_input == pw:
            print "Easy access ! ; )"
    else:
        print "Locked out BITCH"
        

## Question 5:
## a)
## Write a Python function is_prime, that consumes a natural number n, and
## produces True if the number is prime, and False otherwise. A prime number is
## a number which is divisible only be 1 and itself. 

import math

def is_prime(n):
    stop_after= math.sqrt(n)
    divisor= 2
    while divisor < stop_after:
        if n % divisor != 0:
            divisor += 1
        else:
            return False
    return True

## b)
## Write a Python function any_prime_in_range, that consumes two natural
## numbers, lower and upper, where lower <= upper, and produces True if there
## are any prime numbers p satisfying lower <= p <= upper, and False
## otherwise.

def any_prime_in_range(lower,upper):
    while lower <= upper:
        if is_prime(lower):
            return True
        else:
            return any_prime_in_range(lower+1, upper)
    return False

## Question 6:
## Write a Python function is_perfect, that consumes a natural number n
## and produces True if n is a perfect number, and False otherwise.
## A number is considered perfect if the sum of all its divisors (other than itself)
## is n. For example, 6 is a perfect number since 1 + 2 + 3 = 6. 

def get_divisors(num):
    n=1
    lod = []
    while n < num:
        if num % n == 0:
            lod += [n]
        n += 1
    return lod

def is_perfect(n):
    divi= get_divisors(n)
    s= 0
    for d in divi:
        s+= d
    if s == n:
        return True
    else:
        return False