#Copyright 2015-22 Julia Computing Inc. MIT License. 
#This file is used as an example to demo the functionality of this package. 

using Distributions

f(u) = exp(-u^2/2)/√(2pi)

const u1=Uniform(-5.0,+5.0)
const u2=Uniform(0.0, 0.5)

function simulate_pt()
    x=rand(u1)
    y=rand(u2)
    y<f(x)
end

function simulate(num::Number)
     hits=0
     for i in 1:num
        hits = hits + simulate_pt()
    end
    return hits/num*(0.5*10)
end

function simulateTime(num)
    r = @timed simulate(num)
    return (r.value, r.time)
end

simulateArray(x::Array) = [simulate(i) for i in x]

