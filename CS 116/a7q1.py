##
##********************************************************##
## CS 116 Assignment 7, Question 1                        ##
## Christopher Alert                                      ##
##                                                        ##
##(Searching for a target word in a lsit of strings)      ##
##                                                        ##
##                                                        ##
##                                                        ##
##********************************************************##

#
# Question 1
#

duplicate_s = "Duplicate word: "

test= ['got','got','oat','oat','got']
list_of_words = ['apples','bananas','oranges'] 


## (Part A)

## partial_list_search: (listof str) str -> (listof str)
## Consumes a list of strings, list_of_words and a string , target, and 
## produces the list of words in lisT_of_words,which contain the target string,
## without printing duplicates.
## Examples:
## partial_list_search(list_of_words,'banana') => ['bananas']
## partial_list_search(list_of_words,'an') => ['bananas','oranges']
## partial_list_search(list_of_words,'grapes') => [] 
## partial_list_search(list_of_words,'')=> ['apples','bananas','oranges']
##
def partial_list_search(list_of_words, target):
   return filter(lambda x: target in x,list_of_words)
## Testing:
print "Testing partial_list_search"

## partial_list_search(test, 'got') => ['got', 'got', 'got']
print "Test 1"
expected = ['got', 'got', 'got']
ans= partial_list_search(test, 'got')
print ans == expected
assert ans == expected

## partial_list_search(list_of_words,'banana') => ['bananas']
print "Test 2"
expected= ['bananas'] 
ans= partial_list_search(list_of_words,'banana')
print ans == expected
assert ans == expected

## partial_list_search(list_of_words,'an') => ['bananas','oranges'] 
print "Test 3"
expected = ['bananas','oranges']
ans= partial_list_search(list_of_words,'an')
print ans == expected
assert ans == expected

## partial_list_search(list_of_words,'grapes') => []  
print "Test 4"
expected = []
ans= partial_list_search(list_of_words,'grapes')
print ans == expected
assert ans == expected

## partial_list_search(list_of_words,'') => ['apples','bananas','oranges']  
print "Test 5"
expected = ['apples','bananas','oranges']
ans= partial_list_search(list_of_words,'')
print ans == expected
assert ans == expected

## (Part B)

test2= 'GOT got GOT oat OAT got'

## no_duplicates: (listof str) int (listof str)-> (listof str)
## Consumes a lsit l, an int, ind and a list new_list and produces the list
## of strings with none repeated while printing any duplicates of the strings
## passed so far.
## Example:
## no_duplicates(test,0,[]) produces prints Duplicate word: got,on one line
## Duplicate word: got on the next, Duplicate word: oat, on another line,
## and Duplicate word: got on another line before returning ['got, 'oat'].
##
def no_duplicates(l,ind,new_list):
   if ind > (len(l) - 1) :
      return new_list
   if len( partial_list_search(new_list,l[ind]) ) == 0:
      new_list.append(l[ind])
      return no_duplicates(l , ind+1,new_list )
   else:
      print duplicate_s + l[ind]
      return no_duplicates(l , ind+1, new_list)
## Testing:
print "Testing no_duplicates"

## no_duplicates(test, 0, []) =>  ['got', 'oat']
print "Test 1"
expected =  ['got', 'oat']
print "The following should be printed: "
print "Duplicate word: got"
print "Duplicate word: oat"
print "Duplicate word: got"
print "end of expected print"
ans=  no_duplicates(test, 0, [])
print ans == expected
assert ans == expected

## no_duplicates([], 0, []) =>  []
print "Test 2"
expected =  []
ans=  no_duplicates([], 0, [])
print ans == expected
assert ans == expected

## partial_str_search: str str -> (listof str)
## Consumes two  strings, string_of_words and target and produces a list with:
## all words containing the target string regardless of original case,
## no duplicate entries in the list,
## and prints lowercase duplicate words as they are found.
def partial_str_search(string_of_words, target):
   lower_l= string_of_words.lower()
   lower_t= target.lower()
   search_list= lower_l.split()
   list_of_match= partial_list_search( search_list, lower_t)
   return no_duplicates( list_of_match, 0, [] )

## Testing:
print "Testing partial_str_search"

## partial_str_search('Apples Bananas ORANGES', 'banana') =>  ['bananas']
print "Test 1"
expected =  ['bananas']
ans=  partial_str_search('Apples Bananas ORANGES', 'banana')
print ans == expected
assert ans == expected

## partial_str_search('Apples OranGes Bananas ORANGES oranges', 'an')
## => ['oranges','bananas']
print "Test 2"
expected= ['oranges','bananas']
print "The following should be printed: "
print "Duplicate word: oranges"
print "Duplicate word: oranges"
print "end of expected print"
ans= partial_str_search('Apples OranGes Bananas ORANGES oranges', 'an')
print ans == expected
assert ans == expected

## partial_str_search('Apples OranGes Bananas ORANGES oranges', 'go')
## => []
print "Test 3"
expected= []
ans= partial_str_search('Apples OranGes Bananas ORANGES oranges', 'go')
print ans == expected
assert ans == expected

## partial_str_search('Apples OranGes Bananas ORANGES oranges', 'AN')
## => ['oranges','bananas']
print "Test 4"
expected= ['oranges','bananas']
print "The following should be printed: "
print "Duplicate word: oranges"
print "Duplicate word: oranges"
print "end of expected print"
ans= partial_str_search('Apples OranGes Bananas ORANGES oranges', 'AN')
print ans == expected
assert ans == expected

## partial_str_search('') => []
print "Test 5"
expected= []
ans= partial_str_search('', 'go')
print ans == expected
assert ans == expected












