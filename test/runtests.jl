# Testing Script for EMD module
using Base.Test

include("../src/EMDUtil.jl")

println("EMDUtil test started")
#test case for findExtrema function
y = Float64[1,3,1,2]
t = Float64[1,2,3,4]
max, min, tmax, tmin = findExtrema(y, t)

@test max[1] == 1
@test max[2] == 3
@test max[3] == 2

@test tmax[1] == 1
@test tmax[2] == 2
@test tmax[3] == 4

@test min[1] == 1
@test min[2] == 1
@test min[3] == 2

@test tmin[1] == 1
@test tmin[2] == 3
@test tmin[3] == 4
