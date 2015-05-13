#Code containing some utility functions for the EMD algorithm

#Function to find local maximums and minimums of a function
# assuming the function is smooth, we just simply check
# y(i-1) < y(i) < y(i+1) for max and y(i-1)>y(i)>y(i+1) for min
function findExtrema(y, t)

	if(length(y) != length(t))
		throw(ArgumentError("Length of y and t must be the same"))
	end
end