##
##********************************************************##
## CS 116 Assignment 6, Question 2                        ##
## Christopher Alert                                      ##
##                                                        ##
##(Determining the score of a round of games of rock paper##
## scissors between a user and a random computer AI)      ##
##                                                        ##
##                                                        ##
##********************************************************##

#
# Question 2
# 


import random   # needed for get_move()


# global (state) variable 
# all_rocks: bool
all_rocks = False


# strings used for this question
rock = "rock"
paper = "paper"
scissors = "scissors"

input_prompt = "Rock-Paper-Scissors, play! [rock,paper,scissors,end]: "

output_computer_move = "Computer plays"
output_computer_win = "Computer wins"
output_user_win = "User wins"
output_tie = "Tie"
output_end = "Game stats ="


# get_move: None -> str
# Purpose: consumes nothing and produces a string
#    which is a "random" rock-paper-scissor move.
#    That is, it produces one of rock, paper, or scissors
# Examples:
#    get_move() => "paper"
#    get_move() => "rock"
#    get_move() => "paper"
#    get_move() => "scissors"
def get_move():
    if (all_rocks == True):
        return rock
    else:
        x = random.randint(1,3)
        if x==1:
            return rock
        elif x==2:
            return paper
        else:
            return scissors
        
##
        
## str[nonempty] int-> int
## Consumes a string of a positive number,s, and an integer sum, and adds the 
## digits of the string together accumulatively to the integer sum, inputted.
## (usually sum would be zero initially to give the exact sum of the digits)
## Examples:
## sum_digits("123",0) => 6
## sum_digits("0",1) => 1
## sum_digits("1",1) => 0
## sum_digits("425675",0) => 29
        

## 

## int[>=0] int[>=0] int[>=0] -> int
## Consumes three integers representing the number of wins,losses or ties
## and produces the match statistic corresponding to the record where:
## a win gives two points, a tie gives one point and a loss subtracts one point
## Examples:
## match_stats(1,1,1) => 2
## match_stats(5,0,0) => 10
## match_stats(0,5,0) => 5
## match_stats(0,0,5) => -5
def match_stats(wins,losses,ties):
    return 2* wins + ties - losses
## Testing:
print "Testing match_stats"
## match_stats(1,1,1) => 2
print "Test 1"
expected = 2
ans= match_stats(1,1,1)
print ans == expected
assert ans == expected

## match_stats(5,0,0) => 10
print "Test 2"
expected = 10
ans = match_stats(5,0,0)
print ans == expected
assert ans == expected

##match_stats(0,5,0) => -5
print "Test 3"
expected = -5
ans = match_stats(0,5,0)
print ans == expected
assert ans == expected

##match_stats(0,0,5) => 5
print "Test 4"
expected = 5
ans = match_stats(0,0,5)
print ans == expected
assert ans == expected

## rock_paper_scissors_round: int[>=0] int[>=0] int[>=0] -> none
## Consumes three integers w for wins, l fr losses and t for ties,
## and prompts the user to enter a string either rock,paper,scissors or end.
## Effects:
## * if the user enters end, the match statistics corresponding to the wins,
##   losses and ties (usually all originally 0) is printed.
## * if the user enters either 'rock', 'paper' or 'scissors', then the program
##   calculates a random move of either 'rock','paper' or 'scissors' by the
##   computer and prints the move, whether the computer or inputter won 
##   according to game rules, and calls the function again with updated w,l,t.
def rock_paper_scissors_round(w,l,t):
    user_move= raw_input("Rock-Paper-Scissors, play! [rock,paper,scissors,end]: ")
    comp_move= get_move()
    if "end" == user_move:
        print output_end + " " + str( match_stats(w,l,t) )
        
    elif comp_move == user_move:
        print output_computer_move + " " + comp_move
        print output_tie
        return rock_paper_scissors_round(w , l , t+1)
        
    elif user_move == rock and comp_move == paper:
        print output_computer_move + " " + paper
        print output_computer_win
        return rock_paper_scissors_round(w , l+1 , t)
       
    elif comp_move == scissors:
        print output_computer_move + " " + scissors
        print output_user_win
        return rock_paper_scissors_round(w+1 , l , t)
        
    elif user_move == scissors and comp_move == rock:
        print output_computer_move + " " + rock
        print output_computer_win
        return rock_paper_scissors_round(w , l+1 , t)

    elif comp_move == paper:
        print output_computer_move + " " + paper
        print output_user_win
        return rock_paper_scissors_round(w+1 , l , t)
        
    elif user_move == paper and comp_move == scissors:
        print output_computer_move + " " + scissors
        print output_computer_win
        return rock_paper_scissors_round(w , l+1 , t)       

    elif comp_move == rock:
        print output_computer_move + " " + rock       
        print output_user_win
        return rock_paper_scissors_round(w+1 , l , t)
    
## Testing:
print "Testing rock_paper_scissors_round"
## rock_paper_scissors_round(0,0,0) =>None,displays the statistic for the match. 
print "Test 1" 
all_rocks= True
print "If user enters 'rock',then 'paper',then 'scissors',then end,then Game stats = 2 is printed" 
rock_paper_scissors_round(0,0,0)

print "Test 2" 
all_rocks= True
print "If user enters 'scissors',then end,then Game stats = -1 is printed" 
rock_paper_scissors_round(0,0,0)

print "Test 3" 
all_rocks= True
print "If user enters end,then Game stats = 0 is printed" 
rock_paper_scissors_round(0,0,0)


## rock_paper_scissors: none -> none
## Consumes no parameters and produces nothing but prompts the user for input.
## Effects:
## * if the user enters end, the match statistics corresponding to the wins,
##   losses and ties, which all start at 0, is printed.
## * if the user enters either 'rock', 'paper' or 'scissors', then the program
##   calculates a random move of either 'rock','paper' or 'scissors' by the
##   computer and prints the move, whether the computer or inputter won 
##   according to game rules, and prompts for further user input.
## Example:
## for the call rock_paper_scissors() , if the user enters 'rock' and the
## computer plays 'rock', then when prompted for input again the user enters
## 'paper' and the Computer plays 'rock' and again when prompted the user enters
## scissors and the computer plays 'rock', then the user enters end, 2 will be
## displayed.
def rock_paper_scissors():
    rock_paper_scissors_round(0,0,0)   
    
## Testing:
print "Testing rock_paper_scissors"
## rock_paper_scissors() =>None, displays the statistic for the match. 
print "Test 1" 
all_rocks= True
print "If user enters 'rock',then 'paper',then 'scissors',then end,then Game stats = 2 is printed" 
rock_paper_scissors()

print "Test 2" 
all_rocks= True
print "If user enters 'scissors',then end,then Game stats = -1 is printed" 
rock_paper_scissors()

print "Test 3" 
all_rocks= True
print "If user enters end,then Game stats = 0 is printed" 
rock_paper_scissors()

print "Test 4" 
all_rocks= True
print "If user enters 'scissors',then 'scissors',then 'scissors. then end,then Game stats = -3 is printed" 
rock_paper_scissors()

