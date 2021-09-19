
using LinearAlgebra
using Plots
using Images # read and show images, more info here: https://github.com/JuliaImages/Images.jl
using JLD
using Test
include("../../Types/Signal/SignalDefinitions.jl")
include("../../EasyLinalg/Basics.jl")



@testset verbose = true "Signal Testes" begin
    @testset "Build Ops" begin
        # test construction function
        @test SignalBuildU(cos, -10.0:0.1:10.0) == Signal(collect(-10.0:0.1:10.0), cos.(-10.0:0.1:10.0))
        @test SignalBuild([1.0, 2.0, 3.0], [1.0, 2.0, 3.0]) == Signal([1.0, 2.0, 3.0], [1.0, 2.0, 3.0])
        # test type of concatenation
        @test typeof([SignalBuildU(sin, -10.0:0.1:10.0), SignalBuildU(x -> sin(4.0 * x), -10.0:0.1:10.0)]) == Vector{Signal}
    end;
    @testset "Base Ops" begin
        @test Signal([1.0, 2.0, 3.0], [1.0, 2.0, 3.0]) + Signal([1.0, 2.0, 3.0], [1.0, 2.0, 3.0]) == Signal([1.0, 2.0, 3.0], [2.0, 4.0, 6.0])
        @test Signal([1.0, 2.0, 3.0], [1.0, 2.0, 3.0]) - Signal([1.0, 2.0, 3.0], [1.0, 1.0, 1.0]) == Signal([1.0, 2.0, 3.0], [0.0, 1.0, 2.0])
        @test Signal([1.0, 2.0, 3.0], [1.0, 2.0, 3.0]) * 2 == Signal([1.0, 2.0, 3.0], [2.0, 4.0, 6.0])
        @test 2 * Signal([1.0, 2.0, 3.0], [1.0, 2.0, 3.0]) == Signal([1.0, 2.0, 3.0], [2.0, 4.0, 6.0])
        @test Signal([1.0, 2.0, 3.0], [1.0, 2.0, 3.0]) / 2 == Signal([1.0, 2.0, 3.0], [0.5, 1.0, 1.5])
        @test 2 / Signal([1.0, 2.0, 3.0], [1.0, 2.0, 3.0]) == Signal([1.0, 2.0, 3.0], [0.5, 1.0, 1.5])
    end;
    @testset "Safe Checks" begin
        @test_throws ErrorException [Signal([1.0, 2.0, 3.0], [1.0, 2.0, 3.0]), Signal([4.0, 5.0, 6.0], [4.0, 5.0, 6.0]) ]
        @test_throws ErrorException Signal([1.0, 2.0, 3.0], [1.0, 2.0, 3.0]) + Signal([4.0, 5.0, 6.0], [4.0, 5.0, 6.0])
        @test_throws ErrorException Signal([1.0, 2.0, 3.0], [1.0, 2.0, 3.0]) - Signal([4.0, 5.0, 6.0], [4.0, 5.0, 6.0])
    end;
    @testset "EasyLinalg" begin
        @test convex_combination([Signal([1.0, 2.0, 3.0], [1.0, 2.0, 3.0]), Signal([1.0, 2.0, 3.0], [4.0, 5.0, 6.0]) ], 0.5) == [Signal([1.0, 2.0, 3.0], [1.0, 2.0, 3.0]), Signal([1.0, 2.0, 3.0], [2.5,  3.5,  4.5]), Signal([1.0, 2.0, 3.0], [4.0, 5.0, 6.0])]
        @test toNumberVector(Signal([1.0, 2.0, 3.0], [1.0, 2.0, 3.0])) == [1.0, 2.0, 3.0]
        @test toNumberMatrix([Signal([1.0, 2.0, 3.0], [1.0, 2.0, 3.0]), Signal([1.0, 2.0, 3.0], [4.0, 5.0, 6.0]) ]) == [1.0 4.0; 2.0 5.0; 3.0 6.0]
        @test ([ Signal([1.0, 2.0, 3.0], [1.0, 2.0, 3.0]), Signal([1.0, 2.0, 3.0], [4.0, 5.0, 6.0]) ]) * [ 2.0, 3.0] ==  Signal([1.0, 2.0, 3.0], [14.0, 19.0, 24.0])
        @test ([ Signal([1.0, 2.0, 3.0], [1.0, 2.0, 3.0]), Signal([1.0, 2.0, 3.0], [4.0, 5.0, 6.0]) ]) * [ 2.0 3.0; 4.0 5.0 ] == [ Signal([1.0, 2.0, 3.0], [18.0, 24.0, 30.0]), Signal([1.0, 2.0, 3.0], [23.0, 31.0, 39.0]) ]
        @test [Signal([1.0, 2.0, 3.0], [1.0, 2.0, 3.0]), Signal([1.0, 2.0, 3.0], [4.0, 5.0, 6.0])] \ (([ Signal([1.0, 2.0, 3.0], [1.0, 2.0, 3.0]), Signal([1.0, 2.0, 3.0], [4.0, 5.0, 6.0]) ]) * [ 2.0 3.0; 4.0 5.0 ]) ≈ [ 2.0 3.0; 4.0 5.0 ]
    end;
end;    





# B = SignalBuildU(x -> sin(4.0, * x), -10.0:0.1:10.0)
# C = SignalBuildU(cos, -10.0:0.1:10.0)
# A = SignalBuildU(sin, -10.0:0.1:10.0)


# D = [A, B]
# s = size(D)

# # A=convex_combination([A, B], 0.1)
# # t = [ 2.0, 3.0, ; 4.0, 5.0, ]
# # t[:,1]

# C = [ A, B ] * [ 2.0, 3.0; 4.0, 5.0 ] # TESTE PARA VALIDAR lINEARSYSTEM(A,B,C)
# D = [A, B]
# t = [ 2.0, 3.0; 4.0, 5.0, ]

# E = toNumberMatrix([ A, B ]) * [ 2.0, 3.0; 4.0, 5.0 ]
# G = toNumberMatrix([ A, B ])


# H = G\E

# t1 = [1, 2]
# t2 = [1,3]
# toNumberVector(Signal(t2, t1))

# Signal(B.X, toNumberVector(B)) 

# print( D\C)

# lu(toNumberMatrix(D))