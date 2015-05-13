# Testing Script for EMD module
using Base.Test

include("../src/EMDUtil.jl")

println("EMDUtil test started")
#test case for findExtrema function
y = [1 3 1 2]

max, indMax, min, indMin = findExtrema(y)

@test max[1] == 3
@test indMax[1] == 2
@test min[1] == 1
@test indMin[1] == 3
