# Question 1
# A movie is a class containing information about a movie,
# including its title (a string), a genre (the type of movie, a string),
# and its rating (a float between 0 and 10, where 10 is the top rating,
# and corresponds to the imdb rating), and stars is a list of the
# names of some of the actors and actresses in the movie
class movie:
    'Fields: title, genre, rating, stars'

# part a)
# Write a function load_database that consumes a file name, and creates a movie
# database as a dictionary keyed by title, with the movie objects as the value. 
# The file should contain information about several
# movies in the following format (2 lines per movie):
# Casablanca drama 8.8 
# humphrey bogart, ingrid bergman

# part b)
# Write a function format_movie_info that consumes a movie object and 
# produces a string that nicely formats the title, genre and rating of the movie.
# example: format_move_info(casablanca) 
# -> 'title: Casablanca, genre: drama, rating: 8.8'
# Format the string using the string formatting operator %

# part c)
# Write a function code to display the nicely formatted information about
# all the movies in movie_list to a file. However, group the movies by genre in the 
# output file (i.e. all dramas, then all comedies, etc.).


# Question 2
# The UW Weather station has a huge archive of interesting, um, weather
# data. See http://weather.uwaterloo.ca/data.html. You can produce the
# data you are most interested in, or you can download csv (comma 
# separated data) from there. These can be saved as plain text files or in 
# spreadsheet format. For these examples, download csv data for one of
# the available years. 
#
# We need a daily weather class
class daily_data:
    'fields: date, low, high, precip'
# date is a string of the form 'd-mon-year'
# low is the lowest temp of the day (in C)
# high is the highest temp of the day (in C)
# precip is the amount (in mm) of precipation (snow or rain)

# Construct some sample data for testing
str_day1 = '1-Jan-10,-4.0,2.0,4.0\n'
day1 = daily_data()
day1.date = '1-Jan-10'
day1.low = -4.0
day1.high = 2.0
day1.precip = 4.0
str_day2 = '29-Feb-09,5.0,9.0,0.0\n'
day2 = daily_data()
day2.date = '29-Feb-09'
day2.low = 5.0
day2.high = 9.0
day2.precip = 0

# Write functions to do the following:
# a) string_to_daily(s): convert a string to a daily_date object

def string_to_daily(s):
    parts= s[:-1].split(",")
    dd= daily_data()
    dd.date= parts[0]
    dd.low= float(parts[1])
    dd.high= float(parts[2])
    dd.precip= float(parts[3])
    return dd

# b) format_daily_data(a_day): produce a formatted string for a daily_date object

def format_daily_data(a_day):
    form= "Today's date: %s,Low: %f,High: %1g,Precipitation: %g" % (a_day.date,a_day.low, a_day.high, a_day.precip)
    return form
# c) create_weather_dictionary(data):  produce a dictionary with dates as the keys and 
#    daily_data objects as the values

def create_weather_dictionary(data):
    wd={}
    for s in data:
        d1= string_to_daily(s)
        wd[d1.date]= d1
    return wd

def create_weather_dictionary1(data):
    wd={}
    for dd in data:
        wd[dd.date]= dd
    return wd

# d) Weather_Analysis(data_file): reads from file and produces a weather dictionary from the 
#     data

def Weather_Analysis(data_file):
    try:
        f= file(data_file,"r")
        lines= f.readlines()
        f.close()
    except:
        print "Invalid FILE !!!!!!!!"
    wd= {}
    for l in lines:
        d1= string_to_daily(l)
        wd[d1.date]= d1
    w= file("output.txt","w")
    for k in wd:
        w.write(k + "\n")
    w.close()
    return wd

# e) display_all_data(archive): a helper function to print the weather data in dictionary
#

def display_all_data(archive):
    d= Weather_Analysis(archive)
    for k in d:
        print format_daily_data(d[k])

# Now, use the produced dictionary to answer the following questions: 
# * what is total precipitation for the year?
# * what was hottest day? month?
# * what was coldest day? month?
# * how much precipation in a given month?
# * what day had the greatest difference between low and high temps?

# If instead of using a dictionary, we had created a list directly from the 
# data (which is in increasing order of date), it would be easier to answer the
# following questions (as compared to the dictionary storage) -
# * what was the maximum number of days in a row with no precipitation?
# * what was the largest difference in low (or high) temperatures for two consecutive days?


# Question 3
# ElectionsCanada (http://www.elections.ca/) has lots of data available 
# regarding previous elections. Look at the results of the most recent (until NOW) 
# general election (the 40th) and look at the "raw data version (for researchers)":
# http://www.elections.ca/scripts/resval/ovr_40ge.asp?prov=&lang=e
# Some of the data is in csv format. Look at the 
# data and write a program to input the data. You'll need to declare
# some classes. Think of some information you'd like to retrieve.

# Question 4 (well, not really a question, just a data source)
# imdb.com also has its data available for free download (as long 
# as it is for personal, non-profitable use). Take a look. Warning - the
# files are very big!

# Question 5:
# part a)
# Modify character_count from the Module 8 notes to construct a single dictionary for
# a list of strings. Combine the upper and lower case characters counts, and key by the lower
# case character. As well, do not bother to count any newline characters.
# part b)
# Write a function summarize that consumes the names of two files: one for input and one
# for output. Create a character_count dictionary for the input text, and write the results to the
# output file. You can find the texts to some public domain books at 
# http://www.gutenberg.ca/ (be sure to download the txt versions for this question - not the
# pdf versions)
# part c) 
# Modify part b) to write the characters to the data file from the most common character to the 
# least common character appearing in the text. 
# part d) 
# Modify part a) to exclude other characters (e.g. punctuation marks, etc.).

# Question 6
# http://www.ssa.gov/oact/babynames/limits.html
# is a great source of information about names (well, at least names that parents in the US
# give their babies). At this site, you can download a series of files for the following years:
# yob1880.txt, yob1881.txt, ..., yob2009.txt
# which lists the names (female first, then male) given to babies in the US. Each line of the
# has the form:
# name, gender, num
# where gender is M (male) or F (female), and num is the number of occurrences of that name
# for that gender in the US for that year. In each data file, the names are ranked in order of
# decreasing count of occurrences, all females first, and then the male names given. 
#
# Consider the following class to store information about the name occurrences
# (which adds in the rank for that name for that gender, 1 for the first female name, then 2, etc.
# starting with 1 for the first male name, etc.).
# A name_occur object has four fields: a positive integer rank for that name in the
# relevant year (#1 is the most popular), a non-empty string name, a character (either 'F' for 
# female, 'M' for male) for the gender recorded for that name, and a positive integer
# occurrences (which is at least 5) for the number of births recorded for that year 
# for that name. 
class name_occur:
    'fields: rank, name, gender, occurrences'
    def __repr__(self):
        return "%s, %s, %d occurrences, rank %d; " % \
               (self.name, self.gender, self.occurrences,self.rank)
    def __eq__(self, other):
        return self.name==other.name and self.gender==other.gender \
               and self.occurrences==other.occurrences and self.rank==other.rank

# An additional class is needed, as the information is available for all those different years.
# To store the information for a single year, the following class will be used:
# A ranking object has three fields: year (positive integer for year for the information),
# and two lists, female and male, which are lists of name_occur objects (which are the 
# names, number of occurrences and ranking, for females and males in that year)
class ranking:
    'fields: year, female, male'
    def __init__(self, year):
        self.year = year
        self.female = []
        self.male = []
    def __repr__(self):
        return "Results for %d\n%s\n%s" % (self.year, self.female, self.male)
    def __eq__(self, other):
        return self.year==other.year and self.female==other.female and self.male==other.male
    
# part a)
# Write a function str_to_name_occ, which consumes a string of the form read in from the 
# described data file, eg. "Mary, F, 3401\n" and a positive integer, eg. 1, and creates a 
# name_occ object from it (set name, gender, occurrences from the string, rank from the
# additional parameter). 
# part b)
# One way to store the list of names is using a list, with the top-ranked name at position 0
# of the list, and the name ranked at 2 at position 1, etc. Maintain separate lists for male
# and female names, in the ranking object for a year. 
# Write a function read_year_names(year) which 
# consumes a year in the range 1880 to 2009, inclusive,
# and creates a ranking object for that year. Note that you don't know ahead of time how 
# many male or female names there are in the file. You'll need to determine that as you
# process the information from the file. 
# part c)
# The order described in part b) will allow you to easily 
# find the top ranked names, however, it means doing a linear search to find the rank of
# any given name in a year. Consider an alternate representation in which you use a dictionary
# keyed by named (as they are unique). Modify the data definition of ranking for this
# data structure, and write a second version of read_year_names for this organization. 
# part d) 
# Write a Python function read_all_years that will read in all the data files for the years
# start_year up to (but not including) end_year, which are the two parameters to the function.
# As the data is read in, create a dictionary in which the keys are the years, and the values
# are the ranking for that year (using which ever implementation of ranking you prefer). 
# part e)
# Write a function name_results that consumes the dictionary created in part d), 
# a name and a gender, and prints out messages summarizing the popularity of that 
# name (for that gender) for all years in the dictionary. 
# part f)
# Rewrite d) and e) for the other implementation of ranking (i.e. dictionary vs list).
# part g)
# For the application discussed in part e), which implementation do you think is more
# efficient? Do you think there is another application for which the other implementation 
# would be preferred?