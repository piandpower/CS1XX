##
##********************************************************##
## CS 116 Assignment 9, Question 4                        ##
## Christopher Alert                                      ##
##                                                        ##
##( Converting a list of marks to a dictionary grouping   ##
##  marks with the same beginning up until the second last##
##  digit)                                                ##
##                                                        ##
##********************************************************##

#
# Question 4
#

# summarize_data: (listof int[>=0][<=100]) -> (dictof str (listof str)[non-empty]
# Consumes a list of integers betwen 0 and 100, inclusive, representing grades
# and produces a dictionary with key a string representing the digits of the int
# up to the second last digit, and a value of the last digit of any numbers with
# the same starting digits. The list produced will be in ascending order.
# Examples:
# summarize_data([27, 37, 25, 9, 13, 25, 10, 100]) =>  
# => {'1': ['3', '0'], '0': ['9'], '3': ['7'], '2': ['7', '5', '5'], '10': ['0']}
#
# => {'9': ['9'], 
#     '0': ['4','5','2','4','9'],
#     '3': ['4','4','6','6'],
#     '5': ['6'],
#     '4': ['2']}
#
def summarize_data(list_of_marks):
    sum_mark_dict= {}
    for mark in list_of_marks:
        if mark <10:
            mark_s= "0" + str(mark)
        else:
            mark_s= str(mark)
        if mark_s[:-1] not in sum_mark_dict:
            sum_mark_dict[mark_s[:-1]] = []
        sum_mark_dict[mark_s[:-1]].append(mark_s[-1])
    return sum_mark_dict
## Testing
print 'Testing summarize_data'
print 'Test1'
ans= summarize_data([27, 37, 25, 9, 13, 25, 10, 100])
expected= {'1': ['3', '0'], 
           '0': ['9'],
           '3': ['7'],
           '2': ['7', '5', '5'],
           '10': ['0']
           }
assert ans == expected
print ans == expected

print 'Test2'
ans= summarize_data([4 ,5 ,42 ,2 ,4 , 9, 99,34,34,56,36,36])
expected= {'9': ['9'], 
           '0': ['4','5','2','4','9'],
           '3': ['4','4','6','6'],
           '5': ['6'],
           '4': ['2']
           }
assert ans == expected
print ans == expected
