# File used to test the split mechanism

import math

key = "test.txt"

f = open(key, "r")
text = f.read()

num_splits = 2
segments = text.split('\n')
num_segments = len(segments)
segment_size = math.floor(num_segments / num_splits)
    
for i in range(num_splits):
    segment = segments[i * segment_size : (i + 1) * segment_size]
    filename = key[0:-4] + "_segment_" + str(i) + ".txt"
    with open(filename, 'w') as f:
        f.write(' '.join(segment))
