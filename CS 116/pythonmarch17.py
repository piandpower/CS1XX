# count occurences : (listof str) str[len=1]-> int[>-0]
# purpose: consumes a lsit of string and a single character 
# and produces the number of times that character target appears in text.
# example: count_occurences(["a","bc", "" "daefa"], "a") => 3
def count_occurences(text,target):
    count= 0
    for st in text: #for each string
        for ch in st:
            if ch == target:
                count+= 1 # count occurence of target
    return count

## can use for loop through characters in a string = s  who knew 


##
class student:
    'Fields: name, age, mission'

chris= student()
chris.name= "Chris"
chris.age= "18"
chris.mission= "daggering- lmao"
##

hundredstab = {"1": 'five' , "2": "ten", "3": 'fifteen', "4": 'twenty', "5": 'body nuh feeble'}

## hastables for quick retreivals !

## hundredstab['6'] = 'come check me fi di daggering' to add a new element to dict.

## to check if the key already used

hundredstab.has_key('5')

# write a funct common_keys that consumes two dictionaries with a common
# key type and produces the lsit of all keys that appear on both dictionaries

# for example common_keys({'1':'a', 10:'e', 2:'u'}, {5:'x',2:'r',1:'a'})
# produces the lsit [1,2] though the order within the lsit may be diff




def common_keys(d1,d2):
    common= []
    for k in d1.keys():
        if d2.has_key(k):
            common.append(k)
    return common

## or 

def common_keys2(d1,d2):
    keys1= d1.keys()
    keys2= d2.keys()
    inboth= filter(lambda x:x in keys1,keys2)
    return in_both
## put into dict with assignment statement !
