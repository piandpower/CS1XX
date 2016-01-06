# A movie is a class containing information about a movie
# including its title (a string), a genre( type of movie, a string)
# and its rating( a float between 0  and 10, where 10 is the top rating)
# and corresponds to the imdb rating, and stars is a list of actors/actresses
# in the movie (listof str)
class movie:
    'Fields: title, genre, rating, stars'
    
# define a few movies and create a list my_movies
    
# Casablanca, a drama, stars humphrey bogart and ingrid bergman, and rates 8.8
# Princess Bride a fantasy stars robin wright, cary elwes, and mandy patinkin
# and rates 8.1

Casablanca= movie()
Casablanca.title= "Casablanca"
Casablanca.genre= "drama"
Casablanca.rating= "8.8"
Casablanca.stars= ["humphrey bogart", "ingrid bergman"]

# write format-movie_info the consumes a movie object and 
# prod a string tht nicely formats the title genre and rating.

#format_movie_info:movie-> str

# printing Casablanca gives a memory reference but not a layout of field vals
# dir(casablanca) gives field names, doc module 
# instead of having to print each field

def format_movie_info(flick):
    formatted= "title: " + flick.title + ",genre: " + flick.genre + ',rating: ' + str(flick.rating)
    return formatted

my_movies= [Casablanca]

for m in my_movies:
    print format_movie_info(m)
    
class SampleBlock:
    'Feilds: samples, average_amplitude'
    
    # samples: listof floats
    # average_amplitude: float
    
    ## and list ops can be used on sb.samples even sb.samples[ind]
    ## __init__ (self) <- self= a samples block
    
def __init__(self):
    self.samples= []
    self.average_amplitude = 0.0
    
def __repr__(self):
    "The __repr__ method will return a string representation of this SampleBlock"
    return 'samples: ' + str(self.samples) + ', average_amplitude: ' + str(self.average_amplitude)

## you dont even need to call the function but it automatically assigns

## Nested loops
def nested_max(alol):
    cur_max = alol[0][0]
    ## L holds each list
    for L in alol:
        # elem is each element in L
        for elem in L:
            ## see if new max?
            if elem > cur_max:
                cur_max= elem
    	return cur_max

