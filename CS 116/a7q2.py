##
##********************************************************##
## CS 116 Assignment 7, Question 2                        ##
## Christopher Alert                                      ##
##                                                        ##
##(Encrypting and deciphering a string of text using a    ##
## Caesar Cipher  -olnhbwklv- )                           ##
##                                                        ##
##                                                        ##
##********************************************************##
##


plaintest1= "hello._goodbye."
plaintest2= "wklvbzdvbdqqr.lqjb_c_"
plaintest3= "this_was_annoying_x.x"
plaintest4=  "zzzzzzzzzzzzzzz"

#
# Question 2
#

# (Part A)


## encrypter: string -> none
## Consumes a string and produces none.
## Effects:
## where msg_l = list("hello._goodbye.") calling the 
## function encrypter  changes the value of the list to list("khoorcbjrrge.hc")
## where each letter of the original string is moved 3 characters forward
## in the pseudo-alphabet with "_" and "." counted on the end of the alphabet.
## Examples:
## encrypter( list('this_was_annoying_x.x',0) ) => list("wklvbzdvbdqqr.lqjb_c_")
## 
def encrypter(msg_l,ind):
   if ind > (len(msg_l) - 1):
      return msg_l
   if ord( msg_l[ind] ) == 120:
      msg_l[ind] = chr(95)
      return encrypter(msg_l, ind + 1)
   if ord( msg_l[ind] ) == 121:
      msg_l[ind] = chr(46)
      return encrypter(msg_l, ind + 1)
   if ord( msg_l[ind] ) == 122:
      msg_l[ind] = chr(97)
      return encrypter(msg_l, ind + 1)
   if ord( msg_l[ind] ) == 95:
      msg_l[ind] = chr(98)
      return encrypter(msg_l, ind + 1)
   if ord( msg_l[ind] ) == 46:
      msg_l[ind] = chr(99)
      return encrypter(msg_l, ind + 1)
   else:
      msg_l[ind] = chr( 3 + ord( msg_l[ind] ))
      return encrypter(msg_l, ind + 1)
## encrypter( list(plaintest1) ,0) => list('khoorcbjrrge.hc')
print "Test 1"
expected =  list('khoorcbjrrge.hc')
ans=  encrypter( list(plaintest1) , 0)
print ans == expected
assert ans == expected
## encrypter( list(plaintest3) ) => list("wklvbzdvbdqqr.lqjb_c_")
print "Test 2"
expected =  list("wklvbzdvbdqqr.lqjb_c_")
ans=  encrypter( list(plaintest3) , 0)
print ans == expected
assert ans == expected
## encrypter( list(plaintest4) ) => list("aaaaaaaaaaaaaaa")
print "Test 3"
expected = list("aaaaaaaaaaaaaaa")
ans=  encrypter( list(plaintest4) , 0)
print ans == expected
assert ans == expected

## caesar-encrypt: string -> string 
## Purpose: This function consumes a string plain, and produces a string with the
## original message encrypted.
## Examples:
## caesar_encrypt('hello._goodbye.') => 'khoorcbjrrge.hc'
def caesar_encrypt(plain):
   msg_lst= list(plain)   
   return ''.join( encrypter( msg_lst, 0) )
## Testing:
print "Testing caesar_encrypt"

## caesar_encrypt('hello._goodbye.') => 'khoorcbjrrge.hc'
print "Test 1"
expected =  'khoorcbjrrge.hc'
ans=  caesar_encrypt('hello._goodbye.')
print ans == expected
assert ans == expected
## caesar_encrypt(plaintest3) => "wklvbzdvbdqqr.lqjb_c_"
print "Test 2"
expected =  "wklvbzdvbdqqr.lqjb_c_"
ans=  caesar_encrypt(plaintest3)
print ans == expected
assert ans == expected
## caesar_encrypt(plaintest4) => "aaaaaaaaaaaaaaa"
print "Test 3"
expected = "aaaaaaaaaaaaaaa"
ans=  caesar_encrypt(plaintest4)
print ans == expected
assert ans == expected

# (Part B)

## decrypter: string -> none
## Consumes a string and produces none.
## Effects:
## where ciph_l = list( 'khoorcbjrrge.hc' ) calling the 
## function encrypter  changes the value of the list to list(plaintest1)
## where each letter of the original string is moved 3 characters back
## in the pseudo-alphabet with "_" and "." counted on the end of the alphabet.
## Examples:
## encrypter( list('this_was_annoying_x.x',0) ) => list("wklvbzdvbdqqr.lqjb_c_")
## 
def decrypter(ciph_l, ind):
   if ind > (len(ciph_l) - 1):
      return ciph_l
   if ord( ciph_l[ind] ) == 95:
      ciph_l[ind] = chr(120)
      return decrypter(ciph_l, ind + 1)
   if ord( ciph_l[ind] ) == 46:
      ciph_l[ind] = chr(121)
      return decrypter(ciph_l, ind + 1)
   if ord( ciph_l[ind] ) == 97:
      ciph_l[ind] = chr(122)
      return decrypter(ciph_l, ind + 1)
   if ord( ciph_l[ind] ) == 98:
      ciph_l[ind] = chr(95)
      return decrypter(ciph_l, ind + 1)
   if ord( ciph_l[ind] ) == 99:
      ciph_l[ind] = chr(46)
      return decrypter(ciph_l, ind + 1)
   else:
      ciph_l[ind] = chr( ord(ciph_l[ind]) - 3)
      return decrypter(ciph_l, ind + 1)
## Testing:
print "Testing decrypter"

## decrypter( list('khoorcbjrrge.hc') ,0) => list(plaintest1)
print "Test 1"
expected =  list(plaintest1)
ans=  decrypter( list('khoorcbjrrge.hc') , 0)
print ans == expected
assert ans == expected
## decrypter( list("wklvbzdvbdqqr.lqjb_c_") ) => list(plaintest3)
print "Test 2"
expected =  list(plaintest3)
ans=  decrypter( list("wklvbzdvbdqqr.lqjb_c_") , 0)
print ans == expected
assert ans == expected
## decrypter( list("aaaaaaaaaaaaaaa") ) => list(plaintest4)
print "Test 3"
expected = list(plaintest4)
ans=  decrypter( list("aaaaaaaaaaaaaaa") , 0)
print ans == expected
assert ans == expected


## caesar_decrypt: string -> string 
## Purpose: This function consumes a string cipher and produces a string with the
## original message decrypted using a caesar cipher.
## Effects:
## Each letter of the original string is moved 3 characters back in the alphabet
## with "_" and "." counted on the end of the alphabet.
## Examples:
## where plaintest2= "wklvbzdvbdqqr.lqjb_c_", calling 
## caesar_decrypt(plaintest2) produces "this_was_annoying_x.x"
##
def caesar_decrypt(cipher):
   ciph_lst= list(cipher)   
   return ''.join( decrypter( ciph_lst, 0) )
## Testing:
print "Testing caesar_decrypt"

## caesar_decrypt('khoorcbjrrge.hc') => plaintest1
print "Test 1"
expected =  plaintest1
ans=  caesar_decrypt('khoorcbjrrge.hc')
print ans == expected
assert ans == expected
## caesar_decrypt("wklvbzdvbdqqr.lqjb_c_") => plaintest3
print "Test 2"
expected =  plaintest3
ans=  caesar_decrypt("wklvbzdvbdqqr.lqjb_c_")
print ans == expected
assert ans == expected
## caesar_decrypt("aaaaaaaaaaaaaaa") => plaintest4
print "Test 3"
expected = plaintest4
ans=  caesar_decrypt("aaaaaaaaaaaaaaa")
print ans == expected
assert ans == expected

