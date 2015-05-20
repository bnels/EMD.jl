#Function to find local maximums and minimums of a function
# assuming the function is smooth, we just simply check
# y(i-1) < y(i) > y(i+1) for max and y(i-1)> y(i) <y(i+1) for min
#

function findExtrema(y, t)

	max  = []	#array for storing local maxima
	min  = []	#array for storing local minima
	tMax = []	#array for storing location of maxima
	tMin = []	#array for storing location of minima

	for i = 2:length(y)-1
		if(y[i-1] < y[i] && y[i] > y[i+1])
			push!(max, y[i])
			push!(tMax, t[i])
		end

		if(y[i-1] > y[i] && y[i] < y[i+1])
			push!(min, y[i])
			push!(tMin, t[i])
		end
	end

	return max, min, tMax, tMin
end