module LinearSolvers

export NaiveGauss, PivotGauss, LUSolve, CholeskyL, CroutLU, DolittleLU, GaussSeidelSolve,
        InverseLU, InverseLUSolve, Reg, ThomasLU, ThomasLUSolve

using LinearAlgebra
using Statistics

include("Cholesky.jl")
include("CroutLU.jl")
include("DolittleLU.jl")
include("GaussSeidelSolve.jl")
include("InverseLU.jl")
include("InverseLUSolve.jl")
include("LUSolve.jl")
include("NaiveGauss.jl")
include("PivotGauss.jl")
include("TridiagLU.jl")
include("TridiagLUSolve.jl")
include("Reg.jl")













end # module
