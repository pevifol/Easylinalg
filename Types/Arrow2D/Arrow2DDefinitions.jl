using LinearAlgebra
using Plots
using Images # read and show images, more info here: https://github.com/JuliaImages/Images.jl
using JLD
include("../Zero/ZeroDefinitions.jl")


mutable struct Arrow2D <: AbstractVector{Number}
    i
    j
end

function Draw(A::Vector{Arrow2D}, separate = false)
    m=size(A)[1]
    plotsX = []
    plotsY = []
    for i=1:m
        append!(plotsX, [[0, A[i].i]])
        append!(plotsY, [[0, A[i].j]])
    end

    # print("draw arrow2D\n")
    # print(m)
    # print(plotsX)
    # print(plotsY)
    
    if(!separate)
        res = []
        p = plot!(plotsX[1], plotsY[1], arrow=true, label="")
        for i=2:size(plotsY)[1]
            plot!(p, plotsX[i], plotsY[i], arrow=true, label="")
        end
        return p
    end
    
    return plot(plotsX,plotsY, arrow=true, layout = (m, 1), label="")

end

begin 
    import Base: +,*,-,^,/,convert,promote_rule,size,reshape,promote,zero,one,iterate,length,abs2,copy,adjoint,vect, promote_typeof
    
    # addition rule 
    +(a::Arrow2D,b::Arrow2D) = Arrow2D(a.i+b.i, a.j+b.j)
    -(a::Arrow2D,b::Arrow2D) =  Arrow2D(a.i-b.i, a.j-b.j)

    # multiplying by scalar
    *(b::Real,a::Arrow2D) = Arrow2D(a.i * b, a.j * b)
    *(a::Arrow2D,b::Real) = *(b::Real,a::Arrow2D)
    
    /(b::Real,a::Arrow2D) = Arrow2D(a.i / b, a.j / b)

    
    size(a::Arrow2D) = size([a.i,a.j])

    Base.copy(a::Arrow2D) = Arrow2D( deepcopy(a.i), deepcopy(a.j) )
    Base.deepcopy(a::Arrow2D) = Arrow2D( deepcopy(a.i), deepcopy(a.j) )

    Base.getindex(a::Arrow2D, i::Int) = i > 2 || i < 1 ? error("Arrow2D can only have size 2") :  [a.i,a.j][i]
    Base.setindex!(a::Arrow2D, v, i::Int) = i > 2 || i < 1 ? error("Arrow2D can only have size 2") : 
        (i == 1 ? (a.i = v) : (a.j = v) )
    # Base.setindex!(a::Arrow2D, v, i::Int) = i > 2 || i < 1 ? error("Arrow2D can only have size 2") : 
    #     (i == 1 ? Arrow2D(v, a.j) : Arrow2D(a.i, v) )
    # Base.setindex!(a::Arrow2D, v, i::Int) = i > 2 || i < 1 ? error("Arrow2D can only have size 2") : ([a.i,a.j][i] = v)
    
    
end