##
##********************************************************##
## CS 116 Assignment 8, Question 1                        ##
## Christopher Alert                                      ##
##                                                        ##
##( Chopping a list of floats into SampleBlocks of a given##
##  length)                                               ##
##                                                        ##
##********************************************************##

class SampleBlock:
    'Fields: samples, average_amplitude'
    # You do not need to worry about the following two defs (__init__ and __repr__), but
    # you should include them when copying the class definition to your own files

    # The following def serves to initialize the object to default values
    def __init__(self):
        "This initializes the SampleBlock object to default values"
        self.samples = []
        self.average_amplitude = 0.0
    # The following def will create a string representation of the object when you attempt
    # to print it. This is useful for debugging
    def __repr__(self):
        "The __repr__ method will return a string representation of this SampleBlock"
        return "samples: " + str(self.samples) + ", average_amplitude: " + str(self.average_amplitude)

#
# Question 1
#

sl= [0.0, 1.0, 2.0, 6.0, 7.0, 8.0, 1.0, 4.0, 1.0, 9.0]
sl2= [[0.0, 1.0, 2.0],[ 6.0, 7.0, 8.0],[1.0, 4.0, 1.0]]
s1= SampleBlock()
s1.samples= [0.0, 1.0, 2.0]

s2= SampleBlock()
s2.samples= [6.0,7.0,8.0]
s2.average_amplitude= 7.0

s3= SampleBlock()
s3.samples= [1.0,4.0,1.0] 
s3.average_amplitude= 2.0



## avg_amp: SampleBlock -> none
## Consumes a SampleBlock, SB and produces none
## effect: calculates the average amplitude of the SampleBlock ased on the samples
## list and assigns tat value to the SampleBlocks's average_amplitude field.
## Examples:
## avg_amp(s1) where s1.samples= [0.0, 1.0, 2.0] assigns s1.average_amplitude 1.0
##
def avg_amp(SB):
    tot= 0
    for beat in SB.samples:
        tot = beat + tot
    avg= tot/ len(SB.samples)
    SB.average_amplitude= avg
## Testing:
print "Testing avg_amp"
## calling avg_amp(s1) => none but s1.average_amplitude= 1.0
s1.average_amplitude= 3.0
avg_amp(s1)
ans = s1.average_amplitude
expected = 1.0
print ans == expected
assert ans == expected
    
## make_sample_list: (listof (listof float)) -> (listof SampleBlock)
## Consumes a list,loSB, with chopped up sample sublists and assigns them to 
## individual sample blocks and adds makes them into a list of SampleBlock.
## Examples:
## make_sample_list(sl2) => [samples: [0.0,1.0,2.0], average_amplitude: 1.0, 
##                           samples: [6.0,7.0,8.0], average_amplitude: 7.0,
##                           samples: [1.0,4.0,1.0], average_amplitude: 2.0]
def make_sample_list(loSB):
    completed_list= []
    while len(loSB) > 0:
        s1= SampleBlock()
        s1.samples= loSB[0]
        avg_amp(s1)
        completed_list= completed_list + [s1]
        loSB= loSB[1:]
    return completed_list
## Testing:
print "Testing make_sample_list"
print "Test 1"
ans= make_sample_list(sl2)
ans1= ans[0].samples
ans2= ans[0].average_amplitude
ans3= ans[1].samples
ans4= ans[1].average_amplitude
ans5= ans[2].samples
ans6= ans[2].average_amplitude
expected1= [0.0,1.0,2.0]
expected2= 1.0
expected3= [6.0,7.0,8.0]
expected4= 7.0
expected5= [1.0,4.0,1.0]
expected6= 2.0
print ans1 == expected1
print ans2 == expected2
print ans3 == expected3
print ans4 == expected4
print ans5 == expected5
print ans6 == expected6
    
## chop_samples: (listof float) int[>0]-> (listof SampleBlock)
## Consumes a lsit of floats, float_list and an int, block_size and produces
## the list of sample blocks with samples field lists of size block size from the
## float_list input.
## Examples:
## chop_samples(sl, 3) => [samples: [0.0,1.0,2.0], average_amplitude: 1.0, 
##                         samples: [6.0,7.0,8.0], average_amplitude: 7.0,
##                         samples: [1.0,4.0,1.0], average_amplitude: 2.0]
##
##

def chop_samples(float_list, block_size):
    split_sample= float_list
    sb_samples= []
    while len(split_sample) > block_size and (len(split_sample)- block_size)> 0:
        sb_samples= sb_samples + [split_sample[: (block_size )]]
        split_sample= split_sample[block_size:]
    return make_sample_list(sb_samples)
## Testing:
print "Testing chop_samples"

print"Test 1"
ans= chop_samples(sl, 3)
ans1= ans[0].samples
ans2= ans[0].average_amplitude
ans3= ans[1].samples
ans4= ans[1].average_amplitude
ans5= ans[2].samples
ans6= ans[2].average_amplitude
expected1= [0.0,1.0,2.0]
expected2= 1.0
expected3= [6.0,7.0,8.0]
expected4= 7.0
expected5= [1.0,4.0,1.0]
expected6= 2.0
print ans1 == expected1
print ans2 == expected2
print ans3 == expected3
print ans4 == expected4
print ans5 == expected5
print ans6 == expected6





    
