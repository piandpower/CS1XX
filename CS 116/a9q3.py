##
##********************************************************##
## CS 116 Assignment 9, Question 3                        ##
## Christopher Alert                                      ##
##                                                        ##
##( Retrieving a list of marks pertaining to a particular ##
##  assignment from a dictionary with assignments and     ##
##  grades allocated to student_id's)                     ##
##                                                        ##
##                                                        ##
##********************************************************##

#
# Question 3
#

# Defined Constants

marks = { "20100501" : {"A3" : 94.0 },
          "19991007" : {"midterm" : "DNW","A3" : "DNW" },
          "19900101" : { "A4" : 13.0,"A3" : 95.0 }}

# is_float: any -> bool
# Consumes an element, num and produces True if the element can be represented 
# as a floating point number using float(), and False otherwise.
# Examples:
# is_float('CAT')=> False
# is_float(5)=> True
# is_float([])=> False
# is_float("DNW")=> False
def is_float(num):
    try:
        float(num)
        return True
    except:
        return False
## Testing:
print 'Testing is_float'

print 'Test 1'
ans= is_float('CAT')
expected= False
assert ans == expected
print ans == expected

print 'Test 2'
ans= is_float('   6   ')
expected= True

print 'Test 3'
ans= is_float([])
expected= False
assert ans == expected
print ans == expected

print 'Test 4'
ans = is_float(5)
expected = True
assert ans == expected
print ans == expected

# get_marks:(dictof str (dictof str[non-empty] (union str float))) str
#            -> (listof float)
# Consumes a dictionary , marks_dictionary and a string, assessment_name, and 
# produces a sorted list of floats corresponding to the grades associated with
# the assignment that assessment_name represents from within the dictionary for
# any student_id's that completed the assignment (ignoring "DNW" 's.
# Examples:
# get_marks(marks, "A3") => [94.0, 95.0]
# get_marks(marks, 'A4') => [13.0]
# get_marks(marks, 'midterm') => []
#
def get_marks(marks_dictionary, assessment_name):
    mrk_lst= []
    for stu_id in marks_dictionary:
        if assessment_name in marks_dictionary[stu_id]:
            mrk_lst.append(marks_dictionary[stu_id][assessment_name])
    format_lst= filter(is_float, mrk_lst)
    return format_lst
## Testing:
print 'Testing get_marks'

print 'Test 1'
ans= get_marks(marks, "A3")
expected= [94.0, 95.0]
assert ans == expected
print ans == expected

print 'Test 2'
ans= get_marks(marks, "midterm")
expected= []
assert ans == expected
print ans == expected

print 'Test 3'
ans= get_marks(marks, "A4")
expected= [13.0]
assert ans == expected
print ans == expected
