##
##********************************************************##
## CS 116 Assignment 10, Question 4                       ##
## Christopher Alert                                      ##
##                                                        ##
##( Converting a string of marks and student information  ##
##  to a set format list of student information and marks)##
##                                                        ##
##********************************************************##

# A Tichu_Card has two fields: 
# value is one of 2,3,4,5,6,7,8,9,10,'Jack','Queen','King','Ace'
# suit is one of 'Jade', 'Pagoda', 'Star', 'Sword'

class Tichu_Card:
    'Fields: value, suit'
    
    # Initializes the fields of a new Tichu_Card using value and suit, noting that  
    # parameter value is one of 2,3,4,5,6,7,8,9,10,'Jack', 'Queen', 'King', 'Ace'
    # and parameter suit is one of 'Jade', 'Pagoda', 'Star', 'Sword'
    # You can initialize a Tichu_Card object in one of two ways. Consider creating
    # the Jade 4:
    # tc1 = Tichu_Card(4, 'Jade')  i.e. provide values for the fields
    # or
    # tc2 = Tichu_Card() -- this actually sets the fields to nonsense values to be overwritten
    # tc2.value = 4
    # tc2.suit = 'Jade'
    def __init__(self, value=0, suit='None'):
        self.value = value
        self.suit = suit
        
    # __repr__: Tichu_Card -> str
    # Produces a string representation of a Tichu_Card
    def __repr__(self):
        return "%s %s" % (str(self.value), self.suit)
    
    # __eq__: Tichu_Card Tichu_Card -> bool
    # Produces True if both fields of self and other are equal, False otherwise.
    def __eq__(self, other):
        return self.value == other.value and self.suit == other.suit
 
# A Tichu_Player is an object with three fields:
# name - a string for the player's name
# hand - a (listof Tichu_Card), a collection of cards currently in the player's hand
# taken - a (listof Tichu_Card), a collection of cards that the player has taken in this round

class Tichu_Player:
    'Fields: name, hand, taken'

    # Initializes a Tichu_Player object with name n, setting hand and taken to be empty.
    # You can initialize a Tichu_Player object (with empty hand and taken pile) in two 
    # ways. Consider the player named 'Joe'.
    # tp1 = Tichu_Player(Joe')  i.e. provide the name, sets other fields to []
    # or
    # tp2 = Tichu_Card() -- this actually sets name to 'No one'
    # tp2.name = "Joe"
    def __init__(self, n="No one"):
        self.name = n
        self.hand = []
        self.taken = []
    
    # __repr__: Tichu_Player -> str
    # Produces a string representation of the player's information. 
    def __repr__(self):
        return 'Player: %s\nHand includes: %s\nHas taken: %s' % (self.name, self.hand, self.taken)

    # __eq__: Tichu_Player Tichu_Player -> bool
    # Produces True if all the fields of self and other are equal, False otherwise.
    def __eq__(self,other):
        return self.name == other.name and self.hand == other.hand and self.taken==other.taken

# Data Used for Testing
star5 = Tichu_Card("5",'St')
star6 = Tichu_Card("6",'St')
star7 = Tichu_Card("7",'St')
star8 = Tichu_Card("8",'St')
sword7 = Tichu_Card("7",'Sw')
sword10 = Tichu_Card("10",'Sw')
pagoda10 = Tichu_Card("10",'P')
jade9 = Tichu_Card("9",'J')
jade10 = Tichu_Card("10",'J')
jadeJ = Tichu_Card('J','J')
jadeQ = Tichu_Card('Q','J')
jadeK = Tichu_Card('K','J')
jadeA = Tichu_Card('A','J')
my_hand = [star5, star6, star7, sword7, star8,  \
		   jade9,jade10,pagoda10,sword10,jadeJ,jadeQ,jadeK,jadeA]
same_hand= [star8,jade10,pagoda10,sword10]
p= Tichu_Player()
p.name= "Taker"
p.taken= [jadeK,jade10,sword10,pagoda10,star5,star6,star7,sword7]

p2= Tichu_Player()
p2.name= "Handy"

p3= Tichu_Player()
p3.name= "Guy"
p3.hand= [jadeK,jade10,sword10,pagoda10]
p3.taken= [jadeJ,star6,star7,sword7]

p4= Tichu_Player()
p4.name= "Gio"
p4.hand= [jadeK,jade10,sword10,pagoda10]
p4.taken= [star5,star6,star7,sword7]

import os
os.listdir(os.getcwd())

# Question 4


def string_to_Tcard(s):
    form= s.replace('\r\n','')
    fields= form.split()
    T_c= Tichu_Card
    T_c.value= fields[0]
    T_c.suit= fields[1]
    return T_c
    
def comp_card(c1, c2):
    if c1.value == c2.value:
        return 0
    if c1.value.isalpha() == True and c2.value.isalpha() == False:
        return 1
    if c1.value.isalpha() == False and c2.value.isalpha() == True:
        return -1
    if c1.value.isalpha() == True and c2.value.isalpha() == True:
        if c1.value == "Q" and c2.value == "J":
            return 1
        if c1.value == "J" and c2.value == "Q":
            return -1
        if c1.value == "K" and (c2.value == "Q" or c2.value == "J"):
            return 1
        if (c1.value == "J" or c1.value == "Q") and c2.value == "K":
            return -1
        if c1.value == "A":
            return 1
        if c2.value == "A":
            return -1   
    if int(c1.value) > int(c2.value):
        return 1
    elif int(c1.value) <  int(c2.value):
        return -1

# same_val: (listof card) -> bool
# Consumes a list of Tichu_Card and produces a boolean, True if all the cards 
# have the same value, false otherwise.
def same_val(loc):
    ans = True
    ind= 0
    while ans == True:
        try:
            if loc[ind].value ==  loc[ind + 1].value:
                ans= True
                ind += 1
            else:
                return False
        except:
            return True
        
# same_suit: (listof card) -> bool
# Consumes a list of Tichu_Card and produces a boolean, True if all the cards 
# have the same suit, false otherwise.
def same_suit(loc):
    ans = True
    ind= 0
    while ind < (len(loc) -1):
        if loc[ind].suit ==  loc[ind + 1].suit:
            ans= True
            ind += 1
        else:
            return False
    
def consec(cards):
    # if values increasing write in python syntax !
    for idx in range(0,len(cards)):
        if comp_card(cards[idx+1],cards[idx]) != 1:
            return False
    
def is_move(play):
    if len(play) <= 4:
        if same_val(play) == False:
            return False
    if len(play) >= 5:
        if same_val(play) == True:
            return False
        if same_suit(play) == False:
            return False
        if consec(play) == False:
            return False
       
     #   play_min= len(play[0].split(','))
    #if not a move return FALSE else nothing

def can_follow(play1,play2):
    if len(play1) != len(play2):
        if len(play2) != (4 or 5):
            return False
        if len(play2) < len(play1):
            return False
    if len(play1) == 4 and len(play2) == 4:
        if play1[0].value >= play2[0].value:
            return False
    if len(play1) == 4 and len(play2) == 5:
        return False
    if len(play2) >= 5 and len(play2) <= len(play1):
        return False
    if len(play1) >= 5 and len(play2) >= len(play1):
        if comp_card( play1[0], play2[0] ) >= 0:
            return False
        
def is_valid_sequence(filename):
    mf= file(filename,"r")
    moves= mf.readlines()
    mf.close()
    #moves[index]= string_to_Tcard(turn_spread)
    game_record= range(0, len(moves))
    for index in range(0,len(moves)):
        cards_played= moves[index].split(',')
        turn_spread= []
        for card in cards_played:
            turn_spread.append( string_to_Tcard(card) )
        turn_spread.sort(lambda x,y: comp_card(x, y))
        # getting tichu_card object list
        game_record[index] = turn_spread
    for turn in game_record:
        #determining if ech line has a valid move
        if is_move(turn) == False:
            return False
    idx = 0
    while idx +1 < ( len(game_record) - 1): #determining if each lines follow
            if can_follow(game_record[idx], game_record[idx+1]) == False:
                return False
            idx += 1    
    return True

is_valid_sequence("valid-seq1.txt")
    