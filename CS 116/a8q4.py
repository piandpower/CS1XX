##
##********************************************************##
## CS 116 Assignment 8, Question 4                        ##
## Christopher Alert                                      ##
##                                                        ##
##( Calculating the sum of the square difference of       ##
## piecewise sample values in two SampleBlocks)           ##
##                                                        ##
##********************************************************##

#
# Question 4
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

    
# Constants:

# [1.0, 2.0, 3.0], and a right_sample_block with samples values [9.0, 5.0, 1.0
block_1 = SampleBlock() 
block_1.samples = [1.0, 2.0, 3.0]

block_2 = SampleBlock()
block_2.samples = [9.0, 5.0, 1.0] 

block_3 = SampleBlock() 
block_3.samples = [1.0, 4.0] 
block_3.average_amplitude = 2.0

block_4 = SampleBlock() 
block_4.samples = [1.0, 4.0] 
block_4.average_amplitude = 0.9

block_5 = SampleBlock() 
block_5.samples = [1.0, 4.0, 1.0] 
block_5.average_amplitude = 5.0

    
## calculate_square_difference: SampleBlock SampleBlock -> int   
## Consumes two SampleBlock, left_sample_block, right_sample_block, and produces
## the sum of the pairwise square differences of the elements of the samples
## list in each SampleBlock.
## Examples:
## calculate_sum_square_difference(block_1,block_2)=> 77
## calculate_sum_square_difference(block_3,block_4)=> 0
def calculate_sum_square_difference(left_sample_block, right_sample_block):
    curr_sum= 0
    for ind in range(0 , len(left_sample_block.samples) ): 
        curr_sum +=  math.pow(left_sample_block.samples[ind]- right_sample_block.samples[ind], 2)
    return curr_sum
print "Testing calculate_sum_square_difference"
print "Test 1"
ans = calculate_sum_square_difference(block_1,block_2)
expected= 77
print ans == expected
assert ans == expected

print "test 2"
ans= calculate_sum_square_difference(block_3,block_4)
expected= 0
print ans == expected
assert ans == expected
