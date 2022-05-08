using Test
using Images

@testset verbose = true "Image Testes" begin
    @testset "Build Ops" begin
        # test construction function
        @test ToNativeImage(Image("bola.jpg")) == load("bola.jpg")
        @test Image("bola.jpg") != Image("quadrado.jpg")
        # test type of concatenation
        @test typeof([Image("bola.jpg"), Image("quadrado.jpg")]) == Vector{Image}
    end;
    @testset "Base Ops" begin
        @test Image("bola.jpg") + Image("quadrado.jpg") - Image("bola.jpg") == Image("quadrado.jpg")
    end;
    @testset "Safe Checks" begin

    end;
    @testset "EasyLinalg" begin
        @test convex_combination([Image("bola.jpg"), Image("quadrado.jpg")], 0.5) == [Image("bola.jpg"), Image("bola.jpg")*0.5 + Image("quadrado.jpg")*0.5, Image("quadrado.jpg")]
        # @test (Image("quadrado.jpg")) * [ 1.0 0.0; 0.0 -1.0] == Image("quadrado.jpg")
        @test ([ Image("bola.jpg"), Image("quadrado.jpg") ]) * [ 1.0 0.0; 0.0 1.0] ==  [ Image("bola.jpg"), Image("quadrado.jpg") ]
        @test  typeof(([ Image("bola.jpg"), Image("quadrado.jpg") ]) * [ 0.1, 0.2]) == Vector{Image}
    end;
end;    
