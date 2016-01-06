## XOR_dict: (dictof any any) (dictof any any) -> (dictof any any)
## Consumes two dictionaries and produces a new dictionary with
## all key-value pairs (k, v) where k is in exactly one of the
## consumed dictioanaries.
## Example:
## XOR_dict({1: 1, 2: 'foo'}, {2: 'bar', 3: 3}) => {1: 1, 3: 3}
def XOR_dict(dict_one, dict_two):
    result = {}
    for key in dict_one:
        if key not in dict_two:
            result[key] = dict_one[key]
    for key in dict_two:
        if key not in dict_one:
            result[key] = dict_two[key]            
    return result
            

print 'Test cases for XOR_dict'

## XOR_dict({}, {}) => {}
print 'Test case 1'
ans = XOR_dict({}, {})
expected = {}
assert ans == expected
print ans == expected

## XOR_dict({1: 'a', 2: 'b', 'c': 'foo'}, {}) =>
##     {1: 'a', 2: 'b', 'c': 'foo'}
print 'Test case 2'
ans = XOR_dict({1: 'a', 2: 'b', 'c': 'foo'}, {})
expected = {1: 'a', 2: 'b', 'c': 'foo'}
assert ans == expected
print ans == expected

## XOR_dict({1: 1, 2: 2}, {2: 2, 3: 3}) => {1: 1, 3: 3}
print 'Test case 3'
ans = XOR_dict({1: 1, 2: 2}, {2: 2, 3: 3})
expected = {1: 1, 3: 3}
assert ans == expected
print ans == expected
