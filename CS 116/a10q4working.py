
  #  play_min= len(moves[0].split(','))
  #  print moves[0].split(',')
  #  for play in moves:
  
  #      play_pts= play.split(',')
  #      if len(play_pts) < play_min:
  #          return False
#        if play_min == 1:
 #           map(str_to_Tcard,moves)

# split by commas, examine only last entry in readlines of each new thingything
# first either a single
#  if next is a next play, move


    
#       or five consecutive same suit from lowest to highest.
#       if at least first 5 have same suit [0:4] suite= same, for crd in set return
#       true if next > last, next seq if end is true-- return false otherwise
    
    
#can only play a set on same size so... if single, check single then check single for rest
# five distinct cases
## next cards must always be inc. value
# four of a kind bomb can play on a single pair or triple
# four of a kind bomb can play on a four of kind bomb if values bigger
# cant play on straight flush bomb
    
#straight flsh can play on single, pair or triple-- not on a four of kind
# straight flush can play on next straight flush if next one has at least as
# many 5 above AND lowest of first is higher than lowest of next 
# acc lowest of straight flush
    
# do a case for first 1,2,3,4,5--

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
