#Function to find local maximums and minimums of a function
# assuming the function is smooth, we just simply check
# y(i-1) < y(i) > y(i+1) for max and y(i-1)> y(i) <y(i+1) for min
#

function findExtrema(y::Vector{Float64}, t::Vector{Float64})

	maxAr  = Float64[]	#array for storing local maxima
	minAr  = Float64[]	#array for storing local minima
	tMax = Float64[]	#array for storing location of maxima
	tMin = Float64[]	#array for storing location of minima
	n = length(y)

	#add initial points to all arrays
	push!(maxAr, y[1])
	push!(minAr, y[1])
	push!(tMax, t[1])
	push!(tMin, t[1])

	for i = 2:length(y)-1
		if(y[i-1] < y[i] && y[i] > y[i+1])
			push!(maxAr, y[i])
			push!(tMax, t[i])
		end

		if(y[i-1] > y[i] && y[i] < y[i+1])
			push!(minAr, y[i])
			push!(tMin, t[i])
		end
	end

	#add final points to all arrays
	push!(maxAr, y[n])
	push!(minAr, y[n])
	push!(tMax, t[n])
	push!(tMin, t[n])

	#fix value to extrapolate
	maxAr[end] = max(maxAr[end], maxAr[end-1])
	minAr[end] = min(minAr[end], minAr[end-1])
	maxAr[1] = max(maxAr[2], maxAr[1])
	minAr[1] = min(minAr[2], minAr[1])

	return maxAr, minAr, tMax, tMin
end