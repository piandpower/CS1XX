import os
os.listdir(os.getcwd())

def character_count(text):
    characters= {}
    for sentence in text:
        lower_sentence= sentence.lower().replace('\n','')
        for char in lower_sentence:
            if characters.has_key(char):
                characters [char] = characters[char] +1
            else:
                characters [char]= 1
        return characters


# summarie str: str -str-> None
# Produces None
# Effects: Opens the file named story and writes a summary of the characters in 
# story to the file summary. The written information is a list of all diff chars
# that appear in story along with their counts. Upper and loser case char counts should be
# combing. summary also includes the total num of all chars seen except newline.
def summarize(story, summary):
    story_file= file(story,'r') 
    complete= story_file.readlines()
    story_file.close()
    total_occurs= 0
    char_counts= character_count(complete) # see module 8 , build a dict keys str
    # len 1 and values are num times that char occurs.
    summ= file(summary,'w')
    for c in char_counts.keys():
        summ.write('%s: %d\n' % (c ,char_counts[c])) # formatting thingyreads from tuple !!
        total_occurs += char_counts[c]
    summ.close()
    print("In %s, %d characters processed" % (story, total_occurs))
    
marks_summary ={"0" : ["9"], 
                "1" : ["3"],
                "2" : ["5","5", "7"],
                "3" : ["7"]
                }
summarize("sample.txt",'summary1.txt')

#f=file("sample.txt")

# tsting data files:

# say what your 

# all comment test cases possible. ! .
# 


# * donations file is empty
# * donations file contains multiple donations from a single donor
# * donations file contains multiple donors , one from each
# * donations file contains multiple donors, some with multiple donations
# * Create a file for each one. Examine the expected output for each case.