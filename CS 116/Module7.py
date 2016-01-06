## Practice Problems for Module 7

## Write a function build_str that consumes a list of non-empty strings and
## produces the concatenation of all those strings, each separated by
## a single space. Do not add a single space at the end. 
## For example, build_str(["A","B","CDE"]) => "A B CDE"
## First, try writing this using recursion. Then, use abstract list functions.

def helper(los,result):
    if los != []:
        result += ' ' + los[0]
        return helper(los[1:],result)
    else:
        return result.strip()

def build_str(los):
    return helper(los,'')
    

## Write a function new_name that consumes two strings, one containing a 
## person's name current name, and the second containing the person's new 
## last name. The function produces the person's updated name (which might ## be exactly the same). 
## For example, new_name("Abigail Melissa Smith", "Jones") => 
## "Abigail Melissa Jones", 
## new_name("Hao Chan", "Chan") => "Hao Chan", and
## new_name("Timothy Howe", "Howe-Williams") => "Timothy Howe-Williams"

def new_name(cn,nsn):
    name_lst= cn.split()
    name_lst[-1] = nsn
    return ' '.join(name_lst)
    

## Write a function new_names that consumes two lists - one of people's 
## current full names, and a second, parallel list, of their new last names. The 
## function produce a new list containing all the updated names.  
## For example, update_names(["Abigail Melissa Smith", "Hao Chan", 
## "Timothy Howe"], ["Jones", "Chan", "Howe-Williams"]) => 
##     ["Abigail Melissa Jones", "Hao Chan", "Timothy Howe-Williams"]
## Rewrite new_names using abstract list functions.

def helper(l,sn,ac):
    if l != []:
        ac += [new_name(l[0],sn[0])]
        return helper(l[1:],sn[1:],ac)
    else:
        return ac

def update_names(lof, lonsn):
    #return map(new_name, lof, lonsn)
    return helper(lof,lonsn,[])
    

## Write a recursive function count_A_grades which consumes a 
## list of numbers in the range [0:100] and produces the number
## of values from the list in the range [80:100]. 
## Rewrite count_A_grades using abstract list functions. 

def count_A_grades(lon,so):
    #return filter(lambda x: x > 80, lon)
    if lon != []:
        if lon[0] > 80:
            return count_A_grades(lon[1:],so + [lon[0]])
        else:
            return count_A_grades(lon[1:],so)
    else:
        return so
    
#count_A_grades([34,56,78,99,8,34,84,86,87])


## Write the function strange_change, which consumes a non-empty list, and
## sets a value in the list to 100, based on the value of the first
## element in the list. If the first is a valid index, the value
## stored at pos lst[0] is set to 100. If lst[0] < 0, then the first value
## in the list is set to 100. If lst[0) >= len(lst), then the value
## at the last list position is set to 100. The function produces the
## index of the changed value.
## For example,  
## strange_change([3,2,3,5,8,0] => 3, and modifies the consumed list to
##                        [3,2,3,100,8,0]
## strange_change([-2,2,4,9]) => 0, and modifies the consumed list to 
##                       [100,2,4,9]
##  strange_change([90,3]) => 1, and modifies the consumed list to [90,100].

def strange_change(l,ind):
    if l != []:
        if l[ind] < 0:
            l[ind] = 100
            return ind
        if l[ind] >= len(l):
            l[-1] = 100
            return len(l) -1
        else:
            return strange_change(l,ind+1)

## Write a function create_email that consumes three strings:
## - first (for the first name)
## - last (for the last name)
## - domain, 
## and creates and produces an email address as follows:
## F.L@domain
## with the following restrictions:
## * the string F.L contains at most 10 characters (including the period)
## * the string F contains at most 8 characters from first
## * the string L contains at least 1 character from last
## * all characters are lower case
## * F, L contain no spaces or hyphens
##
## You may assume that first and last may contain spaces and hyphens. 
## You may assume that domain does not contain any spaces and hyphens.
##
## examples: 
## create_email('Jenn', 'Heil', "van2010.olym") => "jenn.heil@van2010.olym"
## create_email("Mike", "Robertson", "van2010.olym") 
##     => "mike.rober@van2010.olym"
## create_email("Alexandre", "Bilodeau", "van2010.olym") 
##     => "alexandr.b@van2010.olym"
## create_email("Mae Jo", "Ab-Ner", "MadeUp.com") 
##     => "maejo.abne@madeup.com"

def create_email(f,l,d):
    first= f.replace('-','').replace(' ','')[:8]
    last= l.replace('-','').replace(' ','')
    l_len= 10 - (len(first) + 1)
    last_n= last[1:l_len]
    addy= "%s%s%s%s@%s" % (first,'.',last[0],last_n,d)
    return addy.lower()

## A name is a string of the form
## Title First_Name Last_Name, where
## Title is "Mr.", "Mrs.", "Miss", "Dr.", "Sir", "Lady",
## and there is a single whitespace between each part of the name.
## For example, "Mr. Justin Case" or "Miss Alice Inwonderland".
##
## Write a function new_title which consumes a name
## and produces a new name, which is the same as the first, except
## that if the title was "Miss" or "Mrs.", the new name has
## the title "Ms.".

def new_title(n):
    form= n.split()
    if form[0] == "Miss" or form[0] == "Mrs.":
        form[0]= 'Ms.'
    return ' '.join(form)