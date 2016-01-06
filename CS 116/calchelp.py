import math

def sum_to(n):
    ans= 0
    while n > 0:
        print math.sin(1/n)
        ans= ans + math.sin(1/n)
        n= n-1
    return ans
    