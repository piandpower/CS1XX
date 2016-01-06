

def add_message(inbox, email,msg):
    if address not in inbox:
        inbox[message] = []
    inbox[address].insert(0, message)
    
# to mutate use a method with a dot !!!

inbox = dict()
add_message(inbox, 'a@example.com', 'hi')

## display_most_recent: (dictof str (listof str)) -> None

def display_most_recent(inbox):
    for address in inbox:
    ## to loop over every key in a dictionary its for name in dictname
        print ='From: ' + address + ' Message: ' + inbox[address][0]
        print result
        
def XOR_dict(dict_one, dict_two):
    result= {}
    for key in dict_one:
        if key not in dict_two:
            result[key] = dict_one[key]
    for key in dict_two:
        if key not in dict_one:
            result[key] = dict_two[key]
        return result
    
## because exclusive or.. if in both dictionaries, wont show up since it only has
## unique keys from either hence only on evalue with that key.

class Date:
    def __init__(self, year, month, day):
        self.year= year
        self.month= month
        self.day= day
        
# date_to_str: Date -> str
#
#
def date_to_Str(d):
    return '%s %d, %d' % (
        ['January', 'February', 'March' , 'April', 'May',
         'June', 'July', 'August', 'September', 'October',
         'November', 'December'][d.month][d.day]                                         
        ## always use year month date