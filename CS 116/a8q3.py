##
##********************************************************##
## CS 116 Assignment 8, Question 3                        ##
## Christopher Alert                                      ##
##                                                        ##
##(  ##
## )                                           ##
##                                                        ##
##********************************************************##

#
# Question 3
#

import math

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


block_1 = SampleBlock() 
block_1.samples = [0.0, 1.0, 2.0]
block_1.average_amplitude = 1.0

block_x = SampleBlock() 
block_x.samples = [0.0, 1.0, 2.0]
block_x.average_amplitude = 2.0

block_2 = SampleBlock()
block_2.samples = [6.0, 7.0, 8.0] 
block_2.average_amplitude = 7.0

block_3 = SampleBlock() 
block_3.samples = [1.0, 4.0, 1.0] 
block_3.average_amplitude = 3.0

block_4 = SampleBlock() 
block_4.samples = [1.0, 4.0, 1.0] 
block_4.average_amplitude = 2.5

block_8 = SampleBlock() 
block_8.samples = [1.0, 4.0, 1.0] 
block_8.average_amplitude = 0.9

block_5 = SampleBlock() 
block_5.samples = [1.0, 4.0, 1.0] 
block_5.average_amplitude = 5.0

blocks = [block_1, block_3, block_5]
    
def amp_diff(SB1, SB2):
    return abs( SB1.average_amplitude - SB2.average_amplitude )


def find_min(lst):
    min_ind= 0
    for ind in range[0:len(lst)]:
        if lst[ind] == 0:
            return min_ind
        if lst[ind] < lst[min_ind]:
            min_ind= ind
    return min_ind

## find_closest_sample_block_index: SampleBlock (listof SampleBlock) -> int[>= 0]
## Consumes a SampleBlock, target_sample_block, and a list of sorted SampleBlock
## sorted_list_of_sample_blocks, and produces an int representing the index of
## the SampleBlock with the closest average amplitude to the target block.
## Examples:
##
##
##
##
def find_closest_sample_block_index(target_sample_block, sorted_list_of_sample_blocks):
    SB_l= sorted_list_of_sample_blocks
    t_SB= target_sample_block
    beginning = 0
    end = len(SB_l) - 1  
    while beginning < end:
        middle = (end + beginning )/2
        if amp_diff( SB_l[middle], t_SB ) == 0:
            return middle
        elif (amp_diff( SB_l[middle - 1], t_SB ) <= amp_diff( SB_l[middle], t_SB ) ): 
            end = middle
        else: 
            beginning = middle + 1
            
    return middle

## Testing

print "Testing find_closest_sample_block"

print "Test 1"
#find_closest_sample_block_index(block_2,blocks) => 2

print "Test 2"
#find_closest_sample_block_index(block_4,blocks) => 1

print "Test 3"
# #find_closest_sample_block_index(block_x,blocks) => 0

print "Test 4"
#find_closest_sample_block_index(block_8,blocks) => 0


