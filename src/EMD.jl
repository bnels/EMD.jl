module EMD

include("EMDUtil.jl")
using Splines

export findExtrema
# put code here
println("EMD.jl has been initialized")

#Function to calculate intrinsic mode functions
function IMF(y, t, tol, order, N)

	n = length(y)
	if(length(t) != n)
		throw(DimensionMismatch())
	end

	f = []
	tempf = zeros(n,1)
	tempy = []
	append!(tempy, y)
	avg = zeros(n,1)+1

	#Currently just try to compute N IMFs
	#TO DO replace this by a better stop condition
	for i = 1:N

		#Keep finding extrema of y, finding their average
		#and subtracting the average until the new avg is close to zero
		#Along the way store the sum of the averages
		while(sum(abs(avg)) > tol)

			max, min, tmax, tmin = findExtrema(tempy,t)
			S1 = Spline(max, tmax, order)
			S2 = Spline(max, tmin, order)

			avg = (S1(t) + S2(t))/2.0;
			tempf = tempf + avg
			tempy = tempy - avg
		end

		tempy = []
		append!(tempy, tempf)
		append!(f, tempf)
		tempf = zeros(n,1)
	end

	f = reshape(f, (n,N))

	return f, y
end


end # module
