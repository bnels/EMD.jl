# Testing Script for EMD module
using Base.Test

include("../src/EMDUtil.jl")

println("EMDUtil test started")
#test case for findExtrema function
y = [1 3 1 2]
t = [1 2 3 4]
max, min, tmax, tmin = findExtrema(y, t)

@test max[1] == 3
@test tmax[1] == 2
@test min[1] == 1
@test tmin[1] == 3
