#Copyright 2015-16 Julia Computing Inc. All rights reserved

#This file is used as an example to demo the functionality of this package. 

using Distributions
using JuliaInXL
using Logging
Logging.configure(level=DEBUG)

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
    tic()
    r = simulate(num)
    t = toc()
    return (r, t)
end

simulateArray(x::Array) = [simulate(i) for i in x]


#process_async([simulate, simulateTime], "tcp://127.0.0.1:9999"; bind=true)
