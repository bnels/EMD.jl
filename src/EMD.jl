module EMD

include("EMDUtil.jl")
using Splines

export findExtrema
export IMF
export IF


#Function to calculate intrinsic mode functions
function IMF(y, t, tol=0.01, order=4, N=5)

	n = length(y)
	f = zeros(n,N)
	tempy = copy(y)
	eps = 0.00001

	for i = 1:N
	    avg = zeros(n,1)+1
	    sd = 1.0

	    while(mean(abs(avg))>tol && sd > tol)

	        max, min, tmax, tmin = findExtrema(tempy, t)

	        S1 = Spline(max, tmax, order)
	        S2 = Spline(min, tmin, order)
	        avS = (S1+S2)/2
	        avg = avS(t)
	        tempy = tempy-avg

	        sd = mean( (avg.^2)./((y-f[:,i]).^2 + eps) ) 

	        f[:,i] = f[:,i] + avg

	        println(sd)
	    end

	    tempy = copy(f[:,i])
	end

	C = zeros(n,N)
	C[:,1] = y - f[:,1]
	for i = 2:N
		C[:,i] = f[:,i-1]-f[:,i]
	end

	return C
end

#function to calculate instantaneous frequencies
function IF(C)


end

end # module
