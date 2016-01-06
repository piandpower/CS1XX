## print-duplicates: (listof str) -> none
## (listof str) str -> (listof str)
## Consumes a list of str, los and produces none but prints any duplicate words
## on separate lines.
## Examples:
## print_duplicates(test) produces none but prints Duplicate word: got,on one line
## Duplicate word: oat, on another line, Duplicate word: got on another line.
##
def print_duplicates(los):
   if los.count(los[0]) > 1:
      print duplicate_s + los[0]
      los.remove(los[0])
      print_duplicates(los)
   elif los[1:] != []:
      print_duplicates(los[1:])
