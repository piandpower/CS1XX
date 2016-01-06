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
star5 = Tichu_Card(5,'Star')
star6 = Tichu_Card(6,'Star')
star7 = Tichu_Card(7,'Star')
star8 = Tichu_Card(8,'Star')
sword7 = Tichu_Card(7,'Sword')
sword10 = Tichu_Card(10,'Sword')
pagoda10 = Tichu_Card(10,'Pagoda')
jade9 = Tichu_Card(9,'Jade')
jade10 = Tichu_Card(10,'Jade')
jadeJ = Tichu_Card('Jack','Jade')
jadeQ = Tichu_Card('Queen','Jade')
jadeK = Tichu_Card('King','Jade')
jadeA = Tichu_Card('Ace','Jade')
my_hand = [star5, star6, star7, sword7, star8,  \
		   jade9,jade10,pagoda10,sword10,jadeJ,jadeQ,jadeK,jadeA]

# Question 1
def score(player):
    # replace next line by your code
    pass

# Question 2
def load_player(player_file):
    # replace next line by your code
    pass

# Question 3
def save_player(player, player_file):
    # replace next line by your code
    pass

# Question 4
def is_valid_sequence(filename):
    # replace next line by your code
    pass