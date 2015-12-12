#!/bin/bash

#extracts the thingies. 1. Strips  (/d)  lines 
#that do not (/!d) match either (binary or | escaped with \)
#of a) beginning with (^) '(' and then any number 1-9
#(this is the matrix size) b) Computation or c) MPI.
#2. For the lines matching beginning with '([1-9]' , do:
#3. a. Strip away leading '('
#	b.) strip off ',' followed by any number of any character (rest of line)
#	c.) load next line
#	d.) strip of newline followed by 'Computation time: ' and replace with a ,
#	e.) repeat c-d for 'MPI time:        '.

# Reads this from argument #1 and puts in arg #2


sed -e '{
	/^([1-9]\|^Computation\|^MPI/!d
	/^([1-9]/{
		s/^(//
		s/,.*//
		N
		s/\nComputation time: /,/
		N
		s/\nMPI time:         /,/
		}
	}' $1 > $2


