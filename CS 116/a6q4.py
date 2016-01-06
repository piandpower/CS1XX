##
##********************************************************##
## CS 116 Assignment 6, Question 4                        ##
## Christopher Alert                                      ##
##                                                        ##
##(Creating a function that can estimate the n'th         ##
## fibonacci number)                                      ##
##                                                        ##
##                                                        ##
##********************************************************##

#
# Question 4
#

## after_tax_income: float float int float bool float-> int[>= 0]
## Consumes four floats, rate, income, rent and tuition, an int, age, and
## a bool, student and produces the after tax income of the individual, that is
## (income - deductions) * rate
## Effects:
## * if under 25, all of rent is added to deductions and if 25 or older, 
##   half of rent is added to deductions
## * if a student:
##  -under 18 or over 64, then all of tuition is added to deductions
##  - if 18 to 29, 75% of tuition is added to deductions.
##  - if 30- 64, 50% of tuition is added to deductions.
## * taxable_income is the smaller of 0 and income less deductions.
## Examples:
## after_tax_income(0.1,25000.00, 19, 3000.00, True, 20000.00) => 700
## after_tax_income(0.05, 25000.00, 17, 3000.00, True, 20000.00) => 100
## after_tax_income(0.1, 45000.00, 23, 10000.00, False, 0.00) => 3500
## after_tax_income(0.025, 15000.00, 77, 25000.00, True, 19000.00) => 0
## after_tax_income(0.5, 400000.00, 55, 0.00, False, 0.00) => 200000
##
def after_tax_income(rate, i, a, r, s, t):
    deduction=0
    if s==True:
        if a< 18 or a > 64:
            deduction= t
        elif a <= 29:
            deduction= (t * 0.75)
        elif a <= 64:
            deduction= (t * 0.5)
    if a < 25:
        deduction= deduction + r
    elif a > 25:
        deduction= deduction + (r * 0.5)
    taxable_income= max(0, (i - deduction))
    return int(taxable_income * rate)
    print int(taxable_income * rate)
## Testing:
print "Testing after_tax_income"

## after_tax_income(0.1,25000.00, 19, 3000.00, True, 20000.00) => 700
print "Test 1"
expected = 700
ans= after_tax_income(0.1,25000.00, 19, 3000.00, True, 20000.00)
print ans == expected
assert ans == expected

## after_tax_income(0.05, 25000.00, 17, 3000.00, True, 20000.00) => 100
print "Test 2"
expected = 100
ans= after_tax_income(0.05, 25000.00, 17, 3000.00, True, 20000.00)
print ans == expected
assert ans == expected

## after_tax_income(0.1, 35000.00, 23, 10000.00, False, 0.00) => 3500
print "Test 3"
expected = 3500
ans= after_tax_income(0.1, 45000.00, 23, 10000.00, False, 0.00)
print ans == expected
assert ans == expected

## after_tax_income(0.025, 15000.00, 77, 25000.00, True, 19000.00) => 0
print "Test 4"
expected = 0
ans= after_tax_income(0.025, 15000.00, 77, 25000.00, True, 19000.00)
print ans == expected
assert ans == expected

## after_tax_income(400000.00, 55, 25000.00, True, 100000.00) => 200000
print "Test 5"
expected = 200000
ans= after_tax_income(0.5, 400000.00, 55, 0.00, False, 0.00)
print ans == expected
assert ans == expected


## after_tax_income: float int float bool float -> int[non-negative]
## Consumes three floats income, rent and tuition, an int, age, and
## a bool, student and produces the after tax income of the individual, that is
## (income - deductions) * rate according to certain rules:
## * if aged 35-55 and a student, the rate on which their after tax income is
## calculated is 0.25
## * if income is over 250,000, then the individual's income tax is calculated
##   with no deductions.
## * if under 18, the general tax rate is 0.05
## * if 18-29, the general tax rate is 0.1
## * if 30- 64, except for certain circumstances metioned above the tax rate is
##   0.5
## * if 65 or older the tax rate is 0.025.
## Examples:
## taxes(25000.00, 19, 3000.00, True, 20000.00) => 700
## taxes(25000.00, 17, 3000.00, True, 20000.00) => 100
## taxes(45000.00, 23, 10000.00, False, 0.00) => 3500
## taxes(15000.00, 77, 25000.00, True, 19000.00) => 0
## taxes(400000.00, 55, 25000.00, True, 100000.00) => 200000
##
def taxes(income, age, rent, student, tuition):
    student_tax= 0.05
    youngadult_tax= 0.1
    mid_aged_tax=0.5
    retirement_tax= 0.025
    adult_student_tax= 0.25
    if student == True and income >= 250000:
        return taxes(income, age, 0.00, False, 0.00)
    elif age< 18:
        return after_tax_income(student_tax, income, age, rent, student, tuition)
    elif age > 18 and age <= 29:
        return after_tax_income(youngadult_tax, income, age, rent, student, tuition)
    elif age > 35 and age < 55 and student == True:
        return after_tax_income(adult_student_tax_rate, income, age, rent, student, tuition)
    elif age < 64:
        return after_tax_income(mid_aged_tax,income, age, rent, student, tuition)
    else:
        return after_tax_income(retirement_tax,income, age, rent, student, tuition)
## Testing:
print "Testing taxes"

## taxes(25000.00, 19, 3000.00, True, 20000.00) => 700
print "Test 1"
expected = 700
ans= taxes(25000.00, 19, 3000.00, True, 20000.00)
print ans == expected
assert ans == expected

## taxes(25000.00, 17, 3000.00, True, 20000.00) => 100
print "Test 2"
expected = 100
ans= taxes(25000.00, 17, 3000.00, True, 20000.00)
print ans == expected
assert ans == expected

## taxes(45000.00, 23, 10000.00, False, 0.00) => 3500
print "Test 3"
expected = 3500
ans= taxes(45000.00, 23, 10000.00, False, 0.00)
print ans == expected
assert ans == expected

## taxes(15000.00, 77, 25000.00, True, 19000.00) => 0
print "Test 4"
expected = 0
ans= taxes(15000.00, 77, 25000.00, True, 19000.00)
print ans == expected
assert ans == expected

## taxes(400000.00, 55, 25000.00, True, 100000.00) => 200000
print "Test 5"
expected = 200000
ans= taxes(400000.00, 55, 25000.00, True, 100000.00)
print ans == expected
assert ans == expected
 
 



