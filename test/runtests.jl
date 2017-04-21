module ImageDrawTest

# using Base.Test, ImageDraw, ImageCore, ColorTypes, ColorVectorSpace, FixedPointNumbers

tests = [
    "core.jl",
    "line2d.jl",
    "ellipse2d.jl",
    "circle2d.jl",
    "paths.jl"
]
#=
for t in tests
    @testset "$t" begin
        include(t)
    end
end=#

x1 = 1; y1 = 1
x2 = 2; y2 = 2
x3 = 3; y3 = 3
D = det([[x1, x2, x3] [y1, y2, y3] [1, 1, 1]])
@show D
if D ≈ 0
    println("Is approx")
end
D ≉ 0 || error("Points do not lie on unique circle")
R = [[y2 - y3, x3 - x2] [y2 - y1, x1 - x2]] * [(x1^2 + y1^2)-(x2^2 + y2^2), (x2^2 + y2^2)-(x3^2 + y3^2)] / (2 * D)
@show R
end
