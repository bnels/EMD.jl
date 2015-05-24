module EMD

include("EMDUtil.jl")
using Splines

export findExtrema
export IMF

# put code here
println("EMD.jl has been initialized")

#Function to calculate intrinsic mode functions
function IMF(y, t, tol=0.01, order=3, N=5)

	n = length(y)
	f = zeros(n,N)
	tempy = copy(y)

	for i = 1:N
	    avg = zeros(n,1)+1

	    while(abs(mean(avg))>tol)
	    	
	        max, min, tmax, tmin = findExtrema(tempy, t)
	        S1 = Spline(max, tmax, order)
	        S2 = Spline(min, tmin, order)
	        avS = (S1+S2)/2
	        avg = avS(t)
	        tempy = tempy-avg
	        f[:,i] = f[:,i] + avg

	    end

	    tempy = copy(f[:,i])
	end

	return f
end


end # module
