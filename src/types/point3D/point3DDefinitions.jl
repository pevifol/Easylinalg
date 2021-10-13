mutable struct Point3D <: AbstractVector{Number}
    x
    y
    z
end

function Draw(A::Vector{Point3D}, separate = false)
    m=size(A)[1]
    plotsX = []
    plotsY = []
    plotsZ = []
    for i=1:m
        append!(plotsX, [[0, A[i].x]])
        append!(plotsY, [[0, A[i].y]])
        append!(plotsZ, [[0, A[i].z]])
    end
    
    if(!separate)
        res = []
        p = plot!(plotsX[1], plotsY[1], plotsZ[1], seriestype = "scatter", label="")
        for i=2:size(plotsY)[1]
            plot!(p, plotsX[i], plotsY[i], plotsZ[i], seriestype = "scatter", label="")
        end
        return p
    end
    
    return plot(plotsX,plotsY, seriestype = "scatter", layout = (m, 1), label="")

end

begin 
    import Base: +,*,-,^,/,convert,promote_rule,size,reshape,promote,zero,one,iterate,length,abs2,copy,adjoint,vect, promote_typeof
    
    # addition rule 
    +(a::Point3D,b::Point3D) = Point3D(a.x+b.x, a.y+b.y, a.z+b.z)
    -(a::Point3D,b::Point3D) =  Point3D(a.x-b.x, a.y-b.y, a.z-b.z)

    # multiplying by scalar
    *(b::Real,a::Point3D) = Point3D(a.x * b, a.y * b, a.z * b)
    *(a::Point3D,b::Real) = *(b::Real,a::Point3D)
    
    /(b::Real,a::Point3D) = Point3D(a.x / b, a.y / b, a.z / b)

    
    size(a::Point3D) = size([a.x,a.y,a.z])

    Base.copy(a::Point3D) = Point3D( deepcopy(a.x), deepcopy(a.y), deepcopy(a.z) )
    Base.deepcopy(a::Point3D) = Point3D( deepcopy(a.x), deepcopy(a.y), deepcopy(a.z) )

    Base.getindex(a::Point3D, i::Int) = i > 3 || i < 1 ? error("Point3D can only have size 3") :  [a.x,a.y,a.z][i]
    Base.setindex!(a::Point3D, v, i::Int) = i > 3 || i < 1 ? error("Point3D can only have size 3") : 
        (i == 1 ? (a.x = v) : ( i == 2 ? (a.y = v) : (a.z = v) ) )
    
end