struct Point2D <: AbstractVector{Number}
    x
    y
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