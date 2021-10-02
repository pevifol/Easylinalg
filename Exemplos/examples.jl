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

F = [B, C]
# G=convex_combination(F,0.2)
# display(Draw(G, false)) # FUNCIONANDO true/false

# bx = [B.X, C.X, B.X, C.X, B.X, C.X, B.X, C.X, B.X]
# cx = [B.Y, C.Y, B.Y, C.Y, B.Y, C.Y, B.Y, C.Y, B.Y]
# display( plot( bx , cx , layout=(size(cx)[1],1))  )

# display( plot!( [ [0,1], [0,2] ], [ [0,2], [0,2] ],arrow=true,color=:black,linewidth=2,label="") )
# savefig("./Exemplos/arrow2D.png")

# display( plot!( [ [0,1], [0,2] ], [ [0,2],[0,3] ], [ [0, 3],  [0,4] ] , arrow=3 ,color=:black,linewidth=2,label="") )

# display(quiver([1,2,3],[3,2,1],[1,1,1],quiver=([1,1,1],[1,2,3],[1,1,1]),projection="3d"))


# sleep(10) # aguarda x segundos antes de encerrar
# savefig("./Exemplos/arrow3D.png")
h = Arrow2D(1,2)
h.o = 3
display(h.i)
display(h.j)
# display( Draw([Arrow2D(1,2), Arrow2D(1,3), Arrow2D(2,2), Arrow2D(4,2)],false) )
