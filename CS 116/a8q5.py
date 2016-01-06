##
##********************************************************##
## CS 116 Assignment 8, Question 5                        ##
## Christopher Alert                                      ##
##                                                        ##
##( Selecting a SampleBlock most similar to a target from ##
##  a list )                                              ##
##                                                        ##
##********************************************************##

#
# Question 5
#


class SampleBlock:
    'Fields: samples, average_amplitude'
    # You do not need to worry about the following two defs 
    #(__init__ and __repr__), but
    # you should include them when copying the class definition to your own files

    # The following def serves to initialize the object to default values
    def __init__(self):
        "This initializes the SampleBlock object to default values"
        self.samples = []
        self.average_amplitude = 0.0
    # The following def will create a string representation of the object when 
    # you attempt to print it. This is useful for debugging
    def __repr__(self):
        "The __repr__ method will return a string representation of this SampleBlock"
        return "samples: " + str(self.samples) + ", average_amplitude: " + str(self.average_amplitude)

target_block = SampleBlock()
target_block.samples = [1.0, 2.0, 3.0]
target_block.average_amplitude = 2.0

replacement_block_1 = SampleBlock()
replacement_block_1.samples = [0.0, 0.0, 1.0]
replacement_block_1.average_amplitude = 1.0/3

replacement_block_2 = SampleBlock()
replacement_block_2.samples = [1.0, 1.0, 2.0] 
replacement_block_2.average_amplitude = 4.0/3

replacement_block_3 = SampleBlock()
replacement_block_3.samples = [2.0, 3.0, 4.0] 
replacement_block_3.average_amplitude = 9.0/3

replacement_blocks = [replacement_block_1, replacement_block_2,
                      replacement_block_3]

def block_similarity(left_sample_block, right_sample_block):
    diff_in_amplitude = (left_sample_block.average_amplitude - 
                         right_sample_block.average_amplitude)
    return diff_in_amplitude * diff_in_amplitude    
    
## find_best_match:SampleBlock (listof SampleBlock)(SampleBlock -> int) int int
##                 -> SampleBlock
## Consumes a target SampleBlock,targeT_sample_block, a list of posible 
## replacement SampleBlocks,list_of_replacement_sample_blocks, a similarity 
## function, similarity_function, and two integers, start_index and num_neighbours
## and produces the best SampleBLock from within the list of replacements, that 
## is, the Sampleblock which when put through the similarity function against the
## target_sample_block, yields the lowest number.
## Examples:
## find_best_match(target_block, replacement_blocks, block_similarity, 1, 2)
## => replacement_block_2
##
def find_best_match(target_sample_block,
                    list_of_replacement_sample_blocks,
                    similarity_function,
                    start_index,
                    num_neighbours):
    beg= max( (start_index - num_neighbours) , 0)
    end= min( (start_index + num_neighbours)+ 1,
              len(list_of_replacement_sample_blocks) )
    sublst= list_of_replacement_sample_blocks[beg : end]
    curr_best= sublst[0]
    for ind in range(0, len(sublst) ):
        if (similarity_function(target_sample_block, sublst[ind]) <
            similarity_function(target_block, curr_best) ):
            curr_best= sublst[ind]
    return curr_best
## Testing
print "Testing for find_besT_match"
print "Test 1"
ans = find_best_match(target_block, replacement_blocks, block_similarity, 1, 2)
ans1= ans.samples
ans2= ans.average_amplitude
expected1 = replacement_block_2.samples
expected2 = replacement_block_2.average_amplitude
print ans1 == expected1
print ans2 == expected2
assert ans1 == expected1
assert ans2 == expected2
