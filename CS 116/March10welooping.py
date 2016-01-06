def prime(n):
    test_factor= 2
    while test_factor < n:
        if n % test_factor== 0:
            return false
        else:
            test_factor = test_factor + 1
    return True

## for loop through a list .. for "name" in [ ...] the name is assigned to 
## each element in the list then the function is called on each 

L = []
for k in L:
    pass
## index in a loop is the varibale that is changing
## for loop can recurse on string
    
## to go through part of a list... define list then 
    ## for element in L[blah:blah]:     ...
    
    ## for k in range (2,5):        => k=2 automatically first... execute loop 
    ##                                 body with k = 2 then update k t next val
    ##                                 in list (3) .. and loop and loop and loop
    ##                                 AWOH lol .
    
## only put a return if when the situation is reached then the function is to 
    ## stop or otherwise return outside body of loop    
    
## don't change index of for loop manually 0.o <-- generally do not alter k in
## in loop body
    
def sum_for(ind,ini):
    sum=0
    for i in range(2,5):
        sum = sum + i * i
    return sum

## reduce adds all elements of list together 

## multiple-by: (listof int) int -> None

def multiply_by(vals,m):
    for ind in range(len(vals)):
        vals[ind] *= m
        
## *= or += instead of re-writing the variable name then the add or mult expr


def linear_search (L,w):
    for word in L:
        if word == w:
            return True
    return False
## dont hav to say check next in list b/c the loop automatically does this.

## sorted list inc.
def sort_search (L,w):
    for word in L:
        if word == w:
            return True
        if w > word:
            return False
    return False

def divi_search(L,t): # for sorted lsit only as well !
    for t in L:
        if t == L[(len(L)/2)]:
            return True
        
        if t > L[len(L)/2]:
            L = L[len(L)/2:]
            
        if t < L[:len(L)/2]:
            L= L[:len(L)/2]
    return False
                 
vals= [2,3,4,20,45,67,399,400]   

def binary_search(L,w):
    beginning= 0
    end= len(L) #one past rightmost pt active region is end- beg positions long
    while beginning< end:
        middle= (end+beginning)/2 #int division
        if L[middle] ==w:
        #print w at position middle
            return True
    elif L[middle] > w:
        #print w, '< value at posn', middle
        end= middle ## search right half
    else:
        #print w, '< value at posn', middle
        beginning= middle + 1
    return False

big_list= range(1000000)
        
