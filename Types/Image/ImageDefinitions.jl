using LinearAlgebra
using Plots
using Images # read and show images, more info here: https://github.com/JuliaImages/Images.jl
using JLD
include("../Zero/ZeroDefinitions.jl")


struct Image <:AbstractMatrix{RGB}
    I
end


begin 
    import Base: +,*,-,^,/,convert,promote_rule,size,reshape,promote,zero,one,iterate,length,abs2,copy,adjoint,vect, promote_typeof
    

    Image(Name::String) = Image(load(Name));

    # addition rule 
    +(x::Image,y::Image) = Image(x.I + y.I)
    -(x::Image,y::Image) =  Image(x.I - y.I)

    # multiplying by scalar
    *(y::Real,x::Image) = Image(x.I * y)
    *(x::Image,y::Real) = *(y::Real,x::Image)
    
    /(y::Real,x::Image) = Image(x.I / y)

    
    size(x::Image) = size(x.I)

    Base.copy(x::Image) = Image(deepcopy(x.I))
    Base.deepcopy(x::Image) = Image(deepcopy(x.I))

    Base.getindex(x::Image, I::Int, J::Int) = x.I[I,J]

    Base.setindex!(x::Image, v, I::Int, J::Int) = (x.I[I, j] = v)
    Base.convert(::Type{Image}, a::Matrix{RGB{T}}) where{T} = Image(a)
    
    
end