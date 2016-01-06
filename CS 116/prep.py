greeting = "Hi there. What is your name? " 
name = raw_input(greeting) 
print "Hello, " + name + ". Nice to meet you."

def check_password(pw,most_tries):
    user_input = raw_input("Enter your password:")
    if most_tries > 0:
        if user_input != pw:
            return check_password(pw,most_tries-1)
        if user_input == pw:
            print "Easy access ! ; )"
    else:
        print "You anuh real GAZA BOSS"