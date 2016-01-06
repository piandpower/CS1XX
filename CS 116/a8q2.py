##
##********************************************************##
## CS 116 Assignment 8, Question 2                        ##
## Christopher Alert                                      ##
##                                                        ##
##( Sorting a list of SampleBlock based on                ##
##  average_amplitude)                                    ##
##                                                        ##
##********************************************************##


#
# Question 2
#

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

block_2 = SampleBlock()
block_2.samples = [6.0, 7.0, 8.0] 
block_2.average_amplitude = 7.0

block_3 = SampleBlock() 
block_3.samples = [1.0, 4.0, 1.0] 
block_3.average_amplitude = 2.0

blocks = [block_1, block_2, block_3]



## comp_amp: SampleBlock SampleBlock -> int
## Consumes two SampleBlocks, SB1 and SB2, and produces an int, either 1
## if the avg_amplitude of the first is greater than the second, -1 if the 
## second is bigger and 0 otherwise.
## Examples:
## comp_amp(block_3,block_1) => 1
## comp_amp(block_1,block_3) => -1
## comp_amp(block_1,block_1) => 0
def comp_amp(SB1, SB2):
    if SB1.average_amplitude > SB2.average_amplitude:
        return 1
    elif SB1.average_amplitude <  SB2.average_amplitude:
        return -1
    else: 
        return 0
## Testing
print "Tests for comp_amp"
print "Test 1"
ans = comp_amp(block_3,block_1)
expected= 1
assert ans == expected
print ans == expected

print "Test 2"
ans = comp_amp(block_1,block_3)
expected = -1
assert ans == expected
print ans == expected

print "Test 3"
ans= comp_amp(block_1,block_1)
expected= 0
assert ans == expected
print ans == expected

## sort_sample_blocks: (listof SampleBlock) -> none
## consumes a SampleBlock list, sample_block_list, and produces none.
## effect: sorts the list by average amplitude in ascending order.
## Examples:
## sort_sample_blocks(blocks), makes the order of blocks become[block_1,block_3,
## block_2]
def sort_sample_blocks(sample_block_list):
    sample_block_list.sort(lambda x,y: comp_amp(x, y))
## Testing:
print "Testing sort_sample_blocks"

print "Test 1"
sort_sample_blocks(blocks)
ans= blocks
expected= [block_1,block_3,block_2]
print ans== expected
assert ans == expected

print "Test 2"
blocks1= [block_1,block_3,block_2]
sort_sample_blocks(blocks1)
ans= blocks1
expected= [block_1,block_3,block_2]
print ans== expected
assert ans == expected

