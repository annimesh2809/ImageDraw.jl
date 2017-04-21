@testset "Ellipse" begin
    
    img = zeros(Gray{N0f8}, 10, 10)
    expected = copy(img)
    res = draw(img, Ellipse(Point(5,5), 5, 1))
    expected[5, 1:9] = 1
    @test all(expected .== res) == true

    res = draw(img, Ellipse(5, 5, 5, 5), one(Gray{N0f8}))
    expected = Gray{N0f8}[  0 0 1 1 1 1 1 0 0 0
                            0 1 1 1 1 1 1 1 0 0
                            1 1 1 1 1 1 1 1 1 0
                            1 1 1 1 1 1 1 1 1 0
                            1 1 1 1 1 1 1 1 1 0
                            1 1 1 1 1 1 1 1 1 0
                            1 1 1 1 1 1 1 1 1 0
                            0 1 1 1 1 1 1 1 0 0
                            0 0 1 1 1 1 1 0 0 0
                            0 0 0 0 0 0 0 0 0 0 ]
    @test all(expected .== res) == true

    res = draw(img, Ellipse(CirclePointRadius(5,5,5)))
    @test all(expected .== res) == true

    res = draw(img, Ellipse(CartesianIndex(5,5), 5, 3))
    expected = Gray{N0f8}[  0 0 0 0 0 0 0 0 0 0
                            0 0 0 0 0 0 0 0 0 0
                            0 1 1 1 1 1 1 1 0 0
                            1 1 1 1 1 1 1 1 1 0
                            1 1 1 1 1 1 1 1 1 0
                            1 1 1 1 1 1 1 1 1 0
                            0 1 1 1 1 1 1 1 0 0
                            0 0 0 0 0 0 0 0 0 0
                            0 0 0 0 0 0 0 0 0 0
                            0 0 0 0 0 0 0 0 0 0
                                        ]
    @test all(expected .== res) == true

    res = draw(img, Ellipse(5, 5, 5, 5), Gray{N0f8}(0.5))
    expected = Gray{N0f8}[  0.0 0.0 0.5 0.5 0.5 0.5 0.5 0.0 0.0 0.0
                            0.0 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.0 0.0
                            0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.0
                            0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.0
                            0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.0
                            0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.0
                            0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.0
                            0.0 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.0 0.0
                            0.0 0.0 0.5 0.5 0.5 0.5 0.5 0.0 0.0 0.0
                            0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 ]
    @test all(expected .== res) == true
end