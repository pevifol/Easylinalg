@testset verbose = true "Image Testes" begin
    @testset "Build Ops" begin
        # test construction function
        @test Image("bola.jpg") == Image(load("bola.jpg"))
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
        @test ([ Image("bola.jpg"), Image("quadrado.jpg") ]) * [ 1.0 0.0; 0.0 1.0] ==  [ Image("bola.jpg"), Image("quadrado.jpg") ]
        # @test ([ Image("bola.jpg"), Image("quadrado.jpg") ]) * [ 2.0, 3.0] ==  [ Image("bola.jpg"), Image("quadrado.jpg") ]
        # @test ([ Image([1.0, 2.0]), Image( [4.0, 5.0]) ]) * [ 2.0 3.0; 4.0 5.0 ] == [ Image([18.0, 24.0]), Image( [23.0, 31.0]) ]
        @test ([ Image("bola.jpg"), Image("quadrado.jpg") ]) \ (([ Image("bola.jpg"), Image("quadrado.jpg") ]) * [ 2.0 3.0; 4.0 5.0 ]) == [ 2.0 3.0; 4.0 5.0 ]
        @test ([ Image("bola.jpg"), Image("quadrado.jpg"), Image("quadrado.jpg")]) \ (([ Image("bola.jpg"), Image("quadrado.jpg"), Image("quadrado.jpg")]) * [ 2.0 3.0; 4.0 5.0; 6.0 7.0]) ≈ [ 2.0 3.0; 4.0 5.0; 6.0 7.0]
    end;
end;    
