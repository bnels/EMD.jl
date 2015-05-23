#Function to find local maximums and minimums of a function
# assuming the function is smooth, we just simply check
# y(i-1) < y(i) > y(i+1) for max and y(i-1)> y(i) <y(i+1) for min
#

function findExtrema(y::Vector{Float64}, t::Vector{Float64})

	max  = Float64[]	#array for storing local maxima
	min  = Float64[]	#array for storing local minima
	tMax = Float64[]	#array for storing location of maxima
	tMin = Float64[]	#array for storing location of minima
	n = length(y)

	#add initial points to all arrays
	push!(max, y[1])
	push!(min, y[1])
	push!(tMax, t[1])
	push!(tMin, t[1])

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

	#add final points to all arrays
	push!(max, y[n])
	push!(min, y[n])
	push!(tMax, t[n])
	push!(tMin, t[n])

	return max, min, tMax, tMin
end