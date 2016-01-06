class Date:
    def __init__(self, year, month, day):
        self.year = year
        self.month = month
        self.day = day

## date_to_str: Date -> str
## Consumes a Date a returns a string that represents that string as you
## would use in a business letter, such as "March 12, 2009"
## Example:
## date_to_str(Date(2009, 03, 12)) => "March 12, 2009"
def date_to_str(d):
    return '%s %d, %d' % (
        ['', 'January', 'February', 'March', 'April', 'May',
         'June', 'July', 'August', 'September', 'October',
         'November', 'December'][d.month], d.day, d.year)

print "Test cases for date_to_str"

## date_to_str(Date(2009, 03, 12)) => "March 12, 2009"
print "Test 1"
ans = date_to_str(Date(2009, 03, 12))
expected = "March 12, 2009"
assert ans == expected
print ans == expected