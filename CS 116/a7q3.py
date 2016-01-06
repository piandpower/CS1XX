##
##********************************************************##
## CS 116 Assignment 7, Question 3                        ##
## Christopher Alert                                      ##
##                                                        ##
##(Swapping between and modifying data in CSV and nested  ##
## list format)                                           ##
##                                                        ##
##********************************************************##


#
# Question 3
#

## Nested list(NL)
## is a list of lists of strings that represents data, its either:
## [] or
##
## [['b , c , d']
##  ['e . f . g']]
## Nested List can be of any length, but the lists inside the list must contain
## the same number of strings Ð that is, there are the same number of columns 
## in each row, but there can be any number of rows.

## Comma-Separated Values (CSV) format is either:
## [] or 
## ['a, b, c',
## 'd, f, g',
## 'h, i, j']
## a list of strings with spaces between the words.
## - strings inside the list must contain the same number of commas Ð that is,
## there are the same number of columns in each row, but there can be any number
## of rows.

## Constants:

chg_val_s1 = 'Value at row '
chg_val_s2 = ' column '
chg_val_s3 = ' changed.'

list_data1 = [['Trevor','87.5','84.5'],
             ['Bruce','73.0','75.0'],
             ['Lucy','96.4','94.9']]

csv_data1 = ['Trevor, 87.5, 84.5',
            'Bruce, 73.0, 75.0', 
            'Lucy, 96.4, 94.9']

one= csv_data1[0]
one1= csv_data1[0].split()


## (Part A)

## remove_commas: (listof str) int str-> (listof str)
## Consumes a list of strings los, an int ind, and a list of strings lst,
## and produces a new list which is like the old list only any commas in the
## strings are removed.
## Example:
## remove_commas(one1,0,[])=> ['Trevor', '87.5', '84.5']
##
def remove_commas(los,ind,lst):
    if ind > len(los)-1:
        return lst
    else:
        lst.append( los[ind].replace(',',''))
        return remove_commas(los,ind+1,lst)
## remove_commas(one1,0,[])=> ['Trevor', '87.5', '84.5']
print "Test for remove_commas"
expected= ['Trevor', '87.5', '84.5']
ans= remove_commas(one1,0,[])
assert ans == expected
print ans == expected

## str_to_csv: str -> (listof str)
## Consumes a string, csvstr and produces a list of strings without commas from
## the original string being broken between whitespaces.
## Examples:
## str_to_csv(one)=> ['Trevor', '87.5', '84.5']
##
def str_to_csv(csvstr):
    csvstr_l= csvstr.split()
    return remove_commas(csvstr_l, 0,[])
## Testing:

## str_to_csv(one)=> ['Trevor', '87.5', '84.5']
print "Test for str_to_csv"
expected= ['Trevor', '87.5', '84.5']
ans= str_to_csv(one)
assert ans == expected
print ans == expected

## l_converter: CSV int -> NL
## Consumes a CSV format, csv_l and an int ind and produces a corresponding NL
## by converting each element.
## Examples:
## l_converter(csv_data1,0)=> ['Trevor, 87.5, 84.5',
##                             'Bruce, 73.0, 75.0', 
##                             'Lucy, 96.4, 94.9']
def l_converter(csv_l, ind):
    if ind > len(csv_l) - 1:
        return csv_l    
    else:
        csv_l[ind] = str_to_csv(csv_l[ind])
        return l_converter(csv_l, ind + 1)
## Testing:
## l_converter(csv_data1,0)=> ['Trevor, 87.5, 84.5',
##                             'Bruce, 73.0, 75.0', 
##                             'Lucy, 96.4, 94.9']
print "Testing l_converter"
expected= list_data1
ans= l_converter(csv_data1,0)
print ans == expected
assert ans == expected

list_data1 = [['Trevor','87.5','84.5'],
             ['Bruce','73.0','75.0'],
             ['Lucy','96.4','94.9']]

csv_data1 = ['Trevor, 87.5, 84.5',
            'Bruce, 73.0, 75.0', 
            'Lucy, 96.4, 94.9']

## csv_to_list: CSV -> NL
## Consumes a CSV, csv_data and produces the corresponding NL.
## Examples:
## csv_to_list(csv_data1)=> list_data1
def csv_to_list(csv_data):
    return l_converter(csv_data, 0)
##Testing:
print "Testing csv_to_list"
expected= list_data1
ans= csv_to_list(csv_data1)
print ans == expected
assert ans == expected

## (Part B)


list_data1 = [['Trevor','87.5','84.5'],
             ['Bruce','73.0','75.0'],
             ['Lucy','96.4','94.9']]

csv_data1 = ['Trevor, 87.5, 84.5',
            'Bruce, 73.0, 75.0', 
            'Lucy, 96.4, 94.9']

one= csv_data1[0]
one1= csv_data1[0].split()


## nest_to_str: NL int -> CSV
## Consumes a NL, nl and an int, ind and produces a CSV format list of strings.
## Examples:
## nest_to_str(list_data1,0)=> csv_data1
def nest_to_str(nl,ind):
    if ind > len(nl) -1:
        return nl
    else:
        nl[ind]= ', '.join(nl[ind])
        return nest_to_str(nl,ind+1)
## Testing:
print "Testing nest_to_str"
## nest_to_str(list_data1,0)=> csv_data1
expected = csv_data1
ans= nest_to_str(list_data1,0)
assert ans == expected
print ans == expected

list_data1 = [['Trevor','87.5','84.5'],
             ['Bruce','73.0','75.0'],
             ['Lucy','96.4','94.9']]

csv_data1 = ['Trevor, 87.5, 84.5',
            'Bruce, 73.0, 75.0', 
            'Lucy, 96.4, 94.9']

## list_to_csv: NL -> CSV
## Consimes a NL , list_data and produces its CSV format.
## Example:
## list_to_csv(list_data1)=> csv_data1
def list_to_csv(list_data):
    return nest_to_str(list_data, 0)
##Testing:
print "Testing list_to_csv"
## list_to_csv(list_data1)=> csv_data1
expected = csv_data1
ans= list_to_csv(list_data1)
assert ans == expected
print ans == expected


## (Part C)


list_data1 = [['Trevor','87.5','84.5'],
             ['Bruce','73.0','75.0'],
             ['Lucy','96.4','94.9']]

csv_data1 = ['Trevor, 87.5, 84.5',
            'Bruce, 73.0, 75.0', 
            'Lucy, 96.4, 94.9']

one= csv_data1[0]
one1= csv_data1[0].split()

## change_value: NL int int str -> none
## Consumes a NL, list_data, two ints, row and col and a string, new_val
## and produces none but changes the value in the list at the specified row, and
## column to new_val.
## Effects:
## changes the value of the original NL at row, row and column, col, to new_val
## and prints "Value at row " + str(row) + "column " + str(col) + " changed.".
## Examples:
## calling change_value(list_data1, 0 ,2, '100.0') would print 
## 'Value at row 0 column 2 changed.' and the new value of list_data1[0][2]= 100.0
def change_value(list_data, row, col, new_val):
    list_data[row][col] = new_val
    print chg_val_s1 + str(row) + chg_val_s2 + str(col) + chg_val_s3
## Testing:
print "Testing change_value"
## change_value(list_data1, 0 ,2, '100.0')    
print "Test 1"
print "Expect to see 'Value at row 0 column 2 changed.'"
expected= 100.0
change_value(list_data1, 0 ,2, '100.0')
ans= list_data1[0][2]
 

## (Part D)

list_data1 = [['Trevor','87.5','84.5'],
             ['Bruce','73.0','75.0'],
             ['Lucy','96.4','94.9']]

csv_data1 = ['Trevor, 87.5, 84.5',
            'Bruce, 73.0, 75.0', 
            'Lucy, 96.4, 94.9']

one= csv_data1[0]
one1= csv_data1[0].split()

## sort_csv: CSV, int, bool -> CSV
## Consumes a CSV, csv_data, an int sort_col, and a bool , ascending, and sorts
## the list by column either scending or descending order according to the 
## value of ascending.
## Examples:
## sort_csv(csv_data, 1, False) 
## =>['Lucy, 96.4, 94.9','Trevor, 87.5, 84.5','Bruce, 73.0, 75.0']
## sort_csv(csv_data, 0, True) 
## => ['Bruce, 73.0, 75.0','Lucy, 96.4, 94.9','Trevor, 87.5, 84.5']
def sort_csv(csv_data, sort_col, ascending):
    lst_form= csv_to_list(csv_data)
    if ascending == True :
        lst_form.sort(lambda x,y: cmp(x[sort_col], y[sort_col]), reverse=False)
        return list_to_csv(lst_form)
    if ascending == False :
        lst_form.sort(lambda x,y: cmp(x[sort_col], y[sort_col]), reverse=True)
        return list_to_csv(lst_form)
## Testing:    
print "Testing sort_csv"

print "Test 1"
## sort_csv(csv_data, 1, False) 
## =>['Lucy, 96.4, 94.9','Trevor, 87.5, 84.5','Bruce, 73.0, 75.0']
expected= ['Lucy, 96.4, 94.9','Trevor, 87.5, 84.5','Bruce, 73.0, 75.0']
ans= sort_csv(csv_data1, 1, False)
print ans == expected
assert ans == expected

print "Test 2"
## sort_csv(csv_data, 0, True) 
## => ['Bruce, 73.0, 75.0','Lucy, 96.4, 94.9','Trevor, 87.5, 84.5']
expected= ['Bruce, 73.0, 75.0','Lucy, 96.4, 94.9','Trevor, 87.5, 84.5']
ans= sort_csv(csv_data1, 0, True)
print ans == expected
assert ans == expected

