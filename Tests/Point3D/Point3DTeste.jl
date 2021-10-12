# using LinearAlgebra
# using Plots
# using Images # read and show images, more info here: https://github.com/JuliaImages/Images.jl
# using JLD
using Test
include("../../EasyLinalg/Basics.jl")


@testset verbose = true "Point3D Testes" begin
    @testset "Build Ops" begin
        # test construction function
        # test type of concatenation
        @test typeof([Point3D(1,2,3), Point3D(3,4,5)]) == Vector{Point3D}
    end;
    @testset "Base Ops" begin
        @test Point3D(1,2,3) + Point3D(3,4,5) == Point3D(4,6,8)
        @test Point3D(4,6,8) - Point3D(3,4,5) == Point3D(1,2,3)
        @test Point3D(1,2,3) * 2 == Point3D(2,4,6)
        @test 2 * Point3D(1,2,3) == Point3D(2,4,6)
        @test Point3D(2,4,6) / 2 == Point3D(1,2,3)
    end;
    @testset "Safe Checks" begin
        @test_throws MethodError Point3D(1.0, 2.0, 3.0, 4) 
        @test_throws ErrorException Point3D(1.0, 2.0, 3)[4]
        @test_throws ErrorException Point3D(1.0, 2.0, 3)[4] = 3.0
    end;
    # @testset "EasyLinalg" begin
    #     @test convex_combination( [ Point3D(1.0, 2.0), Point3D(4.0, 8.0) ], 0.5) == [ Point3D(1.0, 2.0), Point3D(2.5, 5), Point3D(4.0, 8.0) ]
    #     @test toNumberVector(Point3D(1.0, 2.0)) == [1.0, 2.0]
    #     @test toNumberMatrix( [ Point3D(1.0, 2.0), Point3D(4.0, 5.0) ] ) == [1.0 4.0; 2.0 5.0]
    #     @test ([ Point3D(1.0, 2.0), Point3D(4.0, 5.0) ]) * [ 1.0 0.0; 0.0 1.0] ==  [ Point3D(1.0, 2.0), Point3D(4.0, 5.0) ]
    #     @test ([ Point3D(1.0, 2.0), Point3D(4.0, 5.0) ]) * [ 2.0, 3.0 ] ==  Point3D(14.0, 19.0)
    #     @test ([ Point3D(1.0, 2.0), Point3D( 4.0, 5.0) ]) * [ 2.0 3.0; 4.0 5.0 ] == [ Point3D(18.0, 24.0), Point3D( 23.0, 31.0 ) ]
    #     @test ([ Point3D(1.0, 2.0), Point3D( 4.0, 5.0) ]) \ (([ Point3D(1.0, 2.0), Point3D( 4.0, 5.0) ]) * [ 2.0 3.0; 4.0 5.0 ]) == [ 2.0 3.0; 4.0 5.0 ]
    #     @test ([ Point3D(1.0, 2.0), Point3D( 4.0, 5.0), Point3D(7.0, 8.0) ]) \ (([ Point3D(1.0, 2.0), Point3D( 4.0, 5.0), Point3D( 7.0, 8.0) ]) * [ 2.0 3.0; 4.0 5.0; 6.0 7.0]) ≈ [ 2.0 3.0; 4.0 5.0; 6.0 7.0]
    # end;
end;    

