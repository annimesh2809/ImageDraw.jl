@testset "Circle" begin
    @testset "CirclePointRadius" begin
        img = zeros(Gray{N0f8}, 10, 10)

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

        res = draw(img, CirclePointRadius(Point(5,5), 5))
        @test all(expected .== res) == true

        res = draw(img, CirclePointRadius(5, 5, 5))
        @test all(expected .== res) == true

        res = draw(img, CirclePointRadius(CartesianIndex(5,5), 5))
        @test all(expected .== res) == true

        res = draw(img, CirclePointRadius(Point(5,5), 5), Gray{N0f8}(0.5))
        expected = map(i->(i==1 ? Gray{N0f8}(0.5) : Gray{N0f8}(0)), expected)
        @test all(expected .== res) == true

    end

    @testset "CircleThreePoints" begin
        img = zeros(Gray{N0f8}, 10, 10)

        expected = Gray{N0f8}[ 0 0 0 0 0 0 0 0 0 0
                               0 0 0 1 1 1 1 1 0 0
                               0 0 1 1 1 1 1 1 1 0
                               0 1 1 1 1 1 1 1 1 1
                               0 1 1 1 1 1 1 1 1 1
                               0 1 1 1 1 1 1 1 1 1
                               0 1 1 1 1 1 1 1 1 1
                               0 1 1 1 1 1 1 1 1 1
                               0 0 1 1 1 1 1 1 1 0
                               0 0 0 1 1 1 1 1 0 0 ]

        res = draw(img, CircleThreePoints(Point(1,5), Point(5,1), Point(10,5)))
        @test all(expected .== res)

        res = draw(img, CircleThreePoints(1,5, 5,1, 10,5))
        @test all(expected .== res)

        res = draw(img, CircleThreePoints(CartesianIndex(5,1), CartesianIndex(1,5), CartesianIndex(5,10)))
        @test all(expected .== res)

        res = draw(img, CircleThreePoints(Point(1,5), Point(5,1), Point(10,5)), Gray{N0f8}(0.5))
        expected = map(i->(i==1 ? Gray{N0f8}(0.5) : Gray{N0f8}(0)), expected)
        @test all(expected .== res) == true

    end
end