##
##********************************************************##
## CS 116 Assignment 9, Question 1                        ##
## Christopher Alert                                      ##
##                                                        ##
##( Converting a string of marks and student information  ##
##  to a set format list of student information and marks)##
##                                                        ##
##********************************************************##

#
# Question 1
#

# read_marks_line: str[non-empty] -> (listof str str str str (union float str))
# Consumes a non-empty string, marks_line of the form assignment name, form, 
# grade, stuent id, surname, a comma then first name, all sparated by at least
# one whitespace, and produces a list with first iteam a string representing the 
# student id, second astring representing the student's last name, then a string
# representing the student's first name, then a string with their assignment name
# and finally a float representing their mark or a string "DNW" if they didn't 
# write the exam.
# Examples:
# read_marks_line("A3 94 20100501      Le      Bon           ,Simon   Lee       
#                   Jon     Lee J   O P   PP     ")
# => ['20100501', 'Le Bon', 'Simon Lee Jon Lee J O P PP', 'A3', 94.0]
# read_marks_line("  midterm      DNW        19991007     Thornton, Billy Bob ")
# => ['19991007', 'Thornton', 'Billy Bob', 'midterm', 'DNW']
# 
# read_marks_line(" A4 13 19900101 Ng,Mark ") 
# => ['19900101', 'Ng', 'Mark', 'A4', 13.0]
#
def read_marks_line(marks_line):
    sep_first= marks_line.split(',')
    f_name= sep_first[1].strip()
    first_name= ' '.join(f_name.split())
    sep_main= sep_first[0].split()
    clean_main= ' '.join(sep_main).strip()
    stu_id= sep_main[2]
    asst= sep_main[0]
    surname= ' '.join(sep_main[3:])
    try:
        grade= float(sep_main[1])
    except:
        grade= "DNW"
    return [stu_id, surname, first_name, asst, grade]
# Testing:
print 'Testing read_marks_line'
print 'Test 1'
## read_marks_line("A3 94 20100501      Le      Bon           ,     Simon   Lee
##                    Jon     Lee J   O P   PP     ")

ans= read_marks_line("A3 94 20100501      Le      Bon           ,     Simon   Lee        Jon     Lee J   O P   PP     ")
expected= ['20100501', 'Le Bon', 'Simon Lee Jon Lee J O P PP', 'A3', 94.0]
assert ans == expected
print ans == expected

print 'Test 2'
## read_marks_line("  midterm      DNW        19991007     Thornton, Billy Bob ")
ans= read_marks_line("  midterm      DNW        19991007     Thornton, Billy Bob ")
expected = ['19991007', 'Thornton', 'Billy Bob', 'midterm', 'DNW']
assert ans == expected
print ans == expected

print 'Test 3'
##read_marks_line(" A4 13 19900101 Ng,Mark ")
ans =read_marks_line(" A4 13 19900101 Ng,Mark ")
expected= ['19900101', 'Ng', 'Mark', 'A4', 13.0] 
assert ans == expected
print ans == expected
