include("../Types/Signal/SignalDefinitions.jl")
include("../Types/Point2D/Point2DDefinitions.jl")

numberTypes = Union{Integer, Float64}
types = Union{Signal, Point2D}


function convex_combination(B,increment)
    x=1:-increment:0
    y=0:increment:1
    C=[x'; y']
    A = B * C
    return A
end

function *(S::Vector{<:types}, w::Vector{<:numberTypes})
    T = toNumberMatrix(S)
    T = T * w
    K = deepcopy(S[1])
    s = size(T)[1]
    for i=1:s
        setindex!(K, T[i], i)
    end
    return K
end


function *( S::Vector{<:types}, w::Matrix{<:numberTypes})
    element = deepcopy(S[1])
    type = typeof(element) 
    K = Vector{type}([element])
    T = toNumberMatrix(S)
    T = T * w
    s = size(T)[2]
    for i=1:s
        for j=1:size(T)[1]
            K[i][j] = T[j,i]
        end
        if( i < s)
            push!(K, deepcopy(element))
        end
    end
    return K
end
    

function toNumberMatrix(S::Vector{<:types})
    K = zeros(size(S[1])[1], size(S)[1])
    for i=1:size(S)[1]
        K[:,i] = toNumberVector(S[i])
    end
    return K
end

function toNumberVector(S::types)
    K = zeros(size(S)[1])
    for j=1:size(S)[1]
        K[j] = getindex(S, j)
    end
    return K
end

function Base.:\(S::Vector{<:types}, W::Vector{<:types})
    K = toNumberMatrix(S)
    J = toNumberMatrix(W)    
    return K\J
end