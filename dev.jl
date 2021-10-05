using LinearAlgebra
using Plots
# using Images
# using JLD
using Test

include("./Types/Signal/SignalDefinitions.jl")
include("./Types/Point2D/Point2DDefinitions.jl")
include("./Types/Arrow2D/Arrow2DDefinitions.jl")
include("./EasyLinalg/Basics.jl")

### Rodar código aleatório aqui ###

# bx = [B.X, C.X, B.X, C.X, B.X, C.X, B.X, C.X, B.X]
# cx = [B.Y, C.Y, B.Y, C.Y, B.Y, C.Y, B.Y, C.Y, B.Y]
# display( plot( bx , cx , layout=(size(cx)[1],1))  )
# display(quiver([1,2,3],[3,2,1],[1,1,1],quiver=([1,1,1],[1,2,3],[1,1,1]),projection="3d"))

display( Draw( [Point2D(1,1), Point2D(2,2), Point2D(3,3), Point2D(1,4)] ) )
sleep(10)