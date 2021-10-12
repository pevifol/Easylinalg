
struct Zero end   #zero Matrix


begin 
    import Base: +,*,-
    
    Base.zero(::Type{Any})= Zero()
    +(::Zero, ::Zero) = Zero()
    -(::Zero, A) = -A
    +(::Zero, A) = A
    +(A,::Zero) = A
    *(::Zero, ::Zero) = Zero()
    *(X, ::Zero) = Zero()

    
end