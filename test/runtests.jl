#Copyright (c) 2015: Julia Computing Inc. All rights reserved.

using JuliaInXL
using Base.Test

@test xldate(1; use1904windowing=true,roundtoSeconds=true) == Date(1904, 1, 2)
@test xldate(1) == Date(1900, 1,1)
@test xldate(42371.49) == DateTime("2016-01-02T11:45:36")
