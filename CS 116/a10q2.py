##
##********************************************************##
## CS 116 Assignment 10, Question 2                       ##
## Christopher Alert                                      ##
##                                                        ##
##( Loading a Tichu_player's information from a file)     ##
##                                                        ##
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

import os
os.listdir(os.getcwd())

# Question 2

# load_player: file -> Tichu_Player
# Consumes a file, player_file, and produces the Tichu_Player corresponding to 
# the text in the file that was read in. 
# Examples:
# if f= file("sample.txt"), and f.readlines()
# is ["Ellen \r\n', 'h 5 Jade \r\n', 't 8 Sword \r\n', 't 8 Pagoda \r\n',
#     'h King Star']
# then calling load_player("sample.txt"), produces 
# Player: Ellen
# Hand includes: [5 Jade, King Star]
# Has taken: [8 Sword, 8 Pagoda]
def load_player(player_file):
    try:
        f = file(player_file, 'r')
        cp= Tichu_Player()
        cp.name= f.readline()[:-1].strip()
        card_lines= f.readlines()
        for card in card_lines:
            if card[0] == "h":
                h_lst= card.split()
                hc= Tichu_Card()
                try:
                    hc.value= int(h_lst[1])
                except:
                    hc.value= h_lst[1]
                hc.suit= h_lst[2]
                cp.hand += [hc]
            elif card[0] == 't':
                t_lst= card.split()
                tc= Tichu_Card()
                try:
                    tc.value= int(t_lst[1])
                except:
                    tc.value= t_lst[1]
                tc.suit= t_lst[2]
                cp.taken += [tc]
        f.close()
        return cp
    except:
        print "Error Opening File"
        return None
## Testing 
print "Testing load_player"
print 'Test 1'
#ans=
#expected=
# assert ans == expected
# print ans == expected
load_player("sample.txt")
    
