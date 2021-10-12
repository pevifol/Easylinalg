using LinearAlgebra
using Plots
using Images # read and show images, more info here: https://github.com/JuliaImages/Images.jl
using JLD
include("../Zero/ZeroDefinitions.jl")


struct Point2D <: AbstractVector{Number}
    x
    y
end

function Draw(A::Vector{Point2D}, separate = false)
    m=size(A)[1]
    plotsX = []
    plotsY = []
    for i=1:m
        append!(plotsX, [[A[i].x]])
        append!(plotsY, [[A[i].y]])
    end
    
    if(!separate)
        res = []
        p = plot!(plotsX[1], plotsY[1], seriestype = "scatter", label="")
        for i=2:size(plotsY)[1]
            plot!(p, plotsX[i], plotsY[i], seriestype = "scatter" , label="")
        end
        return p
    end
    
    return plot(plotsX,plotsY, seriestype = "scatter" , layout = (m, 1), label="")

end

begin 
    import Base: +,*,-,^,/,convert,promote_rule,size,reshape,promote,zero,one,iterate,length,abs2,copy,adjoint,vect, promote_typeof
    
    # addition rule 
    +(a::Point2D,b::Point2D) = Point2D(a.x+b.x, a.y+b.y)
    -(a::Point2D,b::Point2D) =  Point2D(a.x-b.x, a.y-b.y)

    # multiplying by scalar
    *(b::Real,a::Point2D) = Point2D(a.x * b, a.y * b)
    *(a::Point2D,b::Real) = *(b::Real,a::Point2D)
    
    /(b::Real,a::Point2D) = Point2D(a.x / b, a.y / b)

    
    size(a::Point2D) = size([a.x,a.y])

    Base.copy(a::Point2D) = Point2D( deepcopy(a.x), deepcopy(a.y) )
    Base.deepcopy(a::Point2D) = Point2D( deepcopy(a.x), deepcopy(a.y) )

    Base.getindex(a::Point2D, i::Int) = i > 2 || i < 1 ? error("Point2D can only have size 2") :  [a.x,a.y][i]
    Base.setindex!(a::Point2D, v, i::Int) = i > 2 || i < 1 ? error("Point2D can only have size 2") : 
        (i == 1 ? (a.x = v) : (a.y = v) )
    
end