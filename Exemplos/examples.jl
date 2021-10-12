using LinearAlgebra
using Plots
# using Images # read and show images, more info here: https://github.com/JuliaImages/Images.jl
# using JLD
using Test

include("../Types/Signal/SignalDefinitions.jl")
include("../Types/Arrow2D/Arrow2DDefinitions.jl")
include("../EasyLinalg/Basics.jl")

# A = SignalBuildU(sin, -10:0.1:10)
B = SignalBuildU(x -> sin(4 * x), -10:0.1:10)
C = SignalBuildU(cos, -10:0.1:10)

# F = [B, C]
# G=convex_combination(F,0.2)
# display(Draw(G, true))
# sleep(10) # aguarda x segundos antes de encerrar
# savefig("./Exemplos/signal_separated.png")

# display( Draw([Arrow2D(1,2), Arrow2D(1,3), Arrow2D(2,2), Arrow2D(4,2)],false) )
# sleep(10) # aguarda x segundos antes de encerrar
# savefig("./Exemplos/arrow2d_aggregated.png")

# display( Draw([Arrow3D(1,2,1), Arrow3D(1,3,2), Arrow3D(2,2,3), Arrow3D(4,2,4)],false) )
# sleep(10) # aguarda x segundos antes de encerrar
# savefig("./Exemplos/arrow3d_aggregated.png")
