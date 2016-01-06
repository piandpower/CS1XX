Practice Problems for Module 8

## Write a function multiply_by that consumes a list of floating point numbers
## and a single floating point number m, and produces a new list in which the elements
## of the consumed list are multiplied by m. The original list is unchanged.
## Solve this problem using recursion, abstract list functions, and a loop (i.e. three
## different implementation). 
## Example: multiply_by([1.0,-3.0,0.0), 5.0) => [5.0,-15.0,0.0]

## Write a function multiplied_by that consumes a list of floating point numbers
## and a single floating point number m, and modified the consumed list by multiplying
## each element by m. The original list is changed, and no value is returned.
## Example: if L = [1,2,3], multiply_by(L,-1) modifies L to [-1,-2,-3].
## Solve this problem using recursion, and loops (i.e. two different implementations). 

## Write a function longer_than which consumes a list of
## strings los and a non-negative integer n, and counts the number
## of strings in los with more than n characters in them.
## Implement using an abstract list function, a while loop, 
## and a for loop. (i.e. three different implementations)

## Write a function print_each that consumes a list of strings and prints
## each character of each string on a separate line.
## For example, print_each(["a", "bc", "" "def"]) prints the characters
## a,b,c,d,e,f, with exactly one character per line.

## Rewrite linear_search to consume a list of values and a search
## value, and produce the index of the search value in the list if it is
## there, and produce False otherwise.

## Write a function guessing_game which consumes an upper limit
## and generates a secret number, and allows the player to 
## repeatedly guess the number, giving "too high" or "too low"
## hints along the way (and the updated range for the number). 
## The function terminates when the user guesses
## the secret number.

## Rewrite binary_search to consume a sorted list of values and a search 
## value, and produce the index of the search value in the list if it is there,
## and produce the position of where the search value would be in the list 
## if it not in the list. For example, binary_search([2,4,6,8,10],8) => 3
## and binary_search([2,4,6,8,10], 5) => 2. 

## Write a function common_keys that consumes two dictionaries
## with a common key type, and produces the list of all the keys
## that appear on both dictionaries. 
## For example, common_keys({1:'a', 10:'e', 2:'u'}, {5:'x', 2:'r', 1:'a'})
## produces the list [1,2] (though the order within the list may be
## different).
## Write this function using loops. (Also try writing it using abstract
## list functions dealing with the lists of keys in the two dictionaries). 

## Write a function all_keys that consumes two dictionaries with a common
## key type, and produces the list of all the keys that appear in at least one
## of the dictionaries. No key should occur twice in the produced list. 
## For example, all_keys({1:'a', 10:'e', 2:'u'}, {5:'x', 2:'r', 1:'a'})
## produces the list [1,10,2,5] (though the order within the list may be
## different).


## A movie_info is a class containing information about a movie,
## including its title (a string), a genre (the type of movie, a string),
## its stars (a list of strings for the actors' names), 
## and its rating (a float between 0 and 10, where 10 is the top rating,
## and corresponds to the imdb rating)
class movie_info:
    'Fields: title, genre, stars, rating'
## a) Initialize several movie objects, including one for "Casablanca",
## a "drama", starring Humphrey Bogart and Ingrid Bergman, with an 
## 8.8 rating on imdb, and "Witness", a "thriller", starring Harrison Ford, 
## Kelly McGillis, Lukas Haas, with a 7.6 rating.
## b) Write a function build_movie_dictionary that consumes a list of 
## movie_info objects and builds a movie dictionary, with the movie
## titles as the keys and the movie_info objects as the associated values.
## c) Write a function update_rating that consumes a movie dictionary,
## a movie title (that is in the dictionary), and a new rating, and mutates
## the dictionary to update the movies rating.
## d) Write a function better_than that consumes a movie dictionary,
## and a float, cut_off, and produces a list of all the movies in the
## dictionary with at least that rating. 
## For example, if the dictionary contains information about "Casablanca"
## and "Witness", and better_than is called with cut_off 8.0, better_than 
## should produce a list containing the information about "Casablanca" 
## only. 
## e) Write a function upgrade_comedy that consumes movie dictionary
## and a positive float inc, and increases the rating of all movies
## f) # Write a function starring_in which consumes a movie dictionary
## and an actor's name, and returns a list of all the titles of all
## the movies that actor is in.
## g) Write a function genre_averages that consumes a movie dictionary 
## and produces a dictionary of average ratings by genres in the dictionary. 
## For example, if the dictionary includes only "Casablanca" and "Witness", 
## genre_averages would produce the dictionary
## {'drama':8.8, 'thriller':7.6}. 

## Consider a number/word dictionary that has entries of the form:
##                  n : word_for_n
## where n is a natural number, and word_for_n is the 
## written word corresponding to the value n.
## For example, an english version of such a dictionary might be
## eng = { 1:"one", 10:"ten", 21:"twenty-one", 2:"two", 99:"ninety-nine"}
## and a French version might be
## fr = { 2:"deux", 10:"dix", 1:"un", 3:"trois", 21:"vingt-et-un"}
## Now, suppose you want to combine them, into a
## single dictionary, with entries of the form:  n : t
## where translation is an object of the type Translation,
class Translation:
    "Fields: english, french"
## Write a function create_translation which consumes two
## number/word dictionaries (one in English and one 
## in French) and produces a number/Translation dictionary. 
## You can assume: same keys in both consumed dictionaries.

## Consider the following two classes: Student and Class_Information.
##
## Student is an Class with three fields: a string name, an positive integer for 
## the student id, and a string for the major plan of study.
class Student: 
    'Fields: name, id, major'
    def __repr__(self):
        return self.name + '(' + str(self.id) + '): ' + self.major
##
## Class_Information is a Class with three fields: a string for the course title, 
## a string for the instructor's name, and a list of Student objects for the students
## enrolled in the course. 
class Class_Information: 
    'Fields: title, instructor, class_list'
    def __repr__(self):
        formatted = 'Course: ' + self.title + " is taught by " + self.instructor + "\n"
        formatted += "Students enrolled: \n" + str(self.class_list)
        return formatted
## a) Initialize several Student objects: mary ("Mary Sue", 12345, "Math/CA"), 
## xaio ("Xaio", 23456, "CS"), joe ("Joseph", 13579, "CO"). Then, initialize a Class_Information
## object ("CS116", "Lori Case", with mary, xaio, and joe enrolled). 
## b) Write a function students_by_major that consumes a Class_Information object
## and a string representing a major plan of study, and produces the list of the id numbers
## for all students registered in the class with that plan of study.
## c) Write a function to add a new student into a Class_Information object
## d) Write a function to remove a student from a Class_Infomration object
## e) Write a function that consumes a dictionary of Class_Information objects (using the
## course title as the key, and the Class_Information values as the values) and
## and the name of a new course and its instructor. Modify the dictionary to include the
## new course, with an empty class list. 
## f) Write a function that consumes a dictionary of Class_Information objects and
## determines if any student is enrolled in all courses in the dictionary. 
## g) Repeat part f) assuming it is a list of Class_Information objects rather than a 
## dictionary. 
