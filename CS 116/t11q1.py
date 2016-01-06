## add_message: (dictof str (listof str)) str str -> None
## Consumes a dictionary representing an inbox, an email address, and a 
## new message, and produces None.
## Side effect: udpates the inbox dictionary to contain the new message
## Examples:
## inbox = dict()
## add_message(inbox, 'a@example.com', 'Hello!') => None
## inbox == {'a@example.com': ['Hello']}
## add_message(inbox, 'a@example.com', 'Hello again') => None
## inbox == {'a@example.com': ['Hello again', 'Hello']}
def add_message(inbox, address, message):
    if address not in inbox:
        inbox[address] = []
    inbox[address].insert(0, message)

print 'Test cases for add_message'

## add_message({}, 'a@example.com', 'Hello') creates a new entry
print 'Test 1'
inbox = dict()
add_message(inbox, 'a@example.com', 'Hello!')
expected = {'a@example.com': ['Hello!']}
assert inbox == expected
print inbox == expected

## add_message({'a@example.com': ['Hello']}, 'a@example.com', 'Hello again')
## updates inbox
print 'Test 2'
add_message(inbox, 'a@example.com', 'Hello again')
expected = {'a@example.com': ['Hello again', 'Hello!']}
assert inbox == expected
print inbox == expected
