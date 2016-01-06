##
##********************************************************##
## CS 116 Assignment 9, Question 5                        ##
## Christopher Alert                                      ##
##                                                        ##
##( Converting a summarization of marks into a stem and   ##
## leaf plot)                                             ##
##                                                        ##
##********************************************************##

#
# Question 5
#

## Defined Constants:

marks_summary ={"0" : ["9"], 
                "1" : ["3"],
                "2" : ["5","5", "7"],
                "3" : ["7"]
                }

marks_summary2 ={"0" : ['1','2','3','4','5','6','7','8',"9"]}

# stem_and_leaf: (dictof str str) -> (listof str)
# Consumes a dictionary with key a string representing the digits of the number 
# until the second last digit and value of the last digit as a string, 
# marks_summarization, and produces a list of strings, with the numbers within
# each bracket organised as a stem and leaf plot.
# Examples:
# stem_and_leaf(marks_summary)
# => [' 0 | 9',
#     ' 1 | 3',
#     ' 2 | 5 5 7',
#     ' 3 | 7',
#     ' 4 |',
#     ' 5 |',
#     ' 6 |', 
#     ' 7 |',
#     ' 8 |',
#     ' 9 |',
#     '10 |']
# stem_and_leaf(marks_summary2)
# =>[' 0 | 1 2 3 4 5 6 7 8 9',
#    ' 1 |',
#    ' 2 |',
#    ' 3 |',
#    ' 4 |',
#    ' 5 |',
#    ' 6 |', 
#    ' 7 |',
#    ' 8 |',
#    ' 9 |',
#    '10 |']
#
def stem_and_leaf(marks_summarization):
    stem_lst= [" 0 |",
               " 1 |",
               " 2 |",
               " 3 |",
               " 4 |",
               " 5 |",
               " 6 |",
               " 7 |",
               " 8 |",
               " 9 |",
               "10 |"]
    for mark in marks_summarization:
        ind= 0
        while ind <= 10: 
            if int(mark) == int(stem_lst[ind][:2]):
                for mrk in marks_summarization[mark]:
                    stem_lst[ind] = stem_lst[ind] + " " + mrk
            ind += 1
    return stem_lst        
## Testing:
print "Testing stem_and_leaf"
print "Test 1"
ans= stem_and_leaf(marks_summary)
expected= [' 0 | 9',
           ' 1 | 3',
           ' 2 | 5 5 7',
           ' 3 | 7',
           ' 4 |',
           ' 5 |', 
           ' 6 |', 
           ' 7 |', 
           ' 8 |', 
           ' 9 |',
           '10 |']
print ans == expected
assert ans == expected

print "Test 2"
ans= stem_and_leaf(marks_summary2)
expected= [' 0 | 1 2 3 4 5 6 7 8 9',
           ' 1 |',
           ' 2 |',
           ' 3 |',
           ' 4 |',
           ' 5 |', 
           ' 6 |', 
           ' 7 |',
           ' 8 |', 
           ' 9 |',
           '10 |']
print ans == expected
assert ans == expected