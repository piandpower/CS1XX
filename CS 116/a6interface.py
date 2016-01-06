#
# CS116, W#
# CS116, Winter 2011   Assignment #6 (Module 6)
#




#
# Question 1
#
    
def is_valid_sin(sin):
    None


    
    
    
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


    
def rock_paper_scissors():
    None

        

#
# Question 3
#
 

def fib(n):
    None




#
# Question 4
#

def taxes(income, age, rent, student, tuition):
    Noneinter 2011   Assignment #6 (Module 6)
#




#
# Question 1
#
    
def is_valid_sin(sin):
    None


    
    
    
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


    
def rock_paper_scissors():
    None

        

#
# Question 3
#
 

def fib(n):
    None




#
# Question 4
#

def taxes(income, age, rent, student, tuition):
    None
