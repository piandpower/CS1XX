## display_most_recent: (dictof str (listof str)) -> None
## Consumes a dictionary representing an inbox and prints
## the most recent message for each address.
## Example: display_most_recent(
##   {'a@example.com': ['hi again', 'hi'],
##    'b@example.com': ['cool see you then', 'lunch?']})
## prints
## From: a@example.com Message: hi again
## From: b@example.com Message: cool see you then
def display_most_recent(inbox):
    for address in inbox:
        print 'From: ' + address + ' Message: ' + inbox[address][0]

print 'Test cases for display_most_recent'

## display_most_recent({'a@example.com': ['hi again', 'hi']})
## displays 'hi again' message
print 'Test case 1'
print "Expect to see 'From: a@example.com: Message: hi again'"
display_most_recent({'a@example.com': ['hi again', 'hi']})

## display_most_recent({'a@example.com': ['hi again', 'hi'],
##                      'b@example.com': ['cool see you then', 'lunch?']})
## displays 'hi again' and 'cool see you then messages'
## (order not important)
print 'Test case 2'
print "Expect to see 'From: a@example.com Message: hi again'"
print "  and 'From: b@example.com Message: cool see you then"
display_most_recent({'a@example.com': ['hi again', 'hi'],
                     'b@example.com': ['cool see you then', 'lunch?']})