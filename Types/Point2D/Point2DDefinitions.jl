using LinearAlgebra
using Plots
using Images # read and show images, more info here: https://github.com/JuliaImages/Images.jl
using JLD
include("../Zero/ZeroDefinitions.jl")

numberTypes = Union{Integer, Float64}

struct Point2D <: AbstractVector{Number}
    D
end


begin 
    import Base: +,*,-,^,/,convert,promote_rule,size,reshape,promote,zero,one,iterate,length,abs2,copy,adjoint,vect, promote_typeof
    
    # addition rule 
    +(x::Point2D,y::Point2D) = Point2D([x.D[1]+y.D[1], x.D[2]+y.D[2]])
    -(x::Point2D,y::Point2D) =  Point2D([x.D[1]-y.D[1], x.D[2]-y.D[2]])

    # multiplying by scalar
    *(y::Real,x::Point2D) = Point2D([x.D[1] * y, x.D[2] * y])
    *(x::Point2D,y::Real) = *(y::Real,x::Point2D)
    
    /(y::Real,x::Point2D) = Point2D([x.D[1] * y, x.D[2] * y])

    
    size(x::Point2D) = size(x.D)

    Base.copy(x::Point2D) = Point2D(deepcopy(x.D))
    Base.deepcopy(x::Point2D) = Point2D(deepcopy(x.D))

    Base.getindex(x::Point2D, i::Int) = i > 2 || i < 1 ? error("Point2D can only have size 2") :  x.D[i]

    Base.setindex!(x::Point2D, v, i::Int) = i > 2 || i < 1 ? error("Point2D can only have size 2") : (x.D[i] = v)
    
    
end