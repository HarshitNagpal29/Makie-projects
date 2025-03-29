using Makie, GLMakie, Statistics, KernelDensity

n = 500
math_scores = 70 .+ 10 .* randn(n)
science_scores = 65 .+ 15 .* randn(n)

fig = Figure(size = (800, 500))

ax = Axis(fig[1, 1], title = "Exam Score Distributions", xlabel = "Score", ylabel = "Frequency")

hist!(ax, math_scores, color = (:blue, 0.5) , label = "Math", bins = 20)
hist!(ax, science_scores, color = (:orange, 0.5) , label = "Science", bins = 20)

kde_math = kde(math_scores)
lines!(ax, kde_math.x, kde_math.density * n, color = :red, linewidth=2, label="Math Density")

kde_science = kde(science_scores)
lines!(ax, kde_science.x, kde_science.density * n, color = :green, linewidth=2, label="Science Density")

vlines!(ax, [mean(math_scores)], color = :purple, label = "Math Mean", linewidth=2, linestyle=:dash)
vlines!(ax, [mean(science_scores)], color = :brown, label = "Science Mean", linewidth=2, linestyle=:dash)
vlines!(ax, [median(math_scores)], color = :cyan, label = "Math Median", linewidth=2, linestyle=:dash)
vlines!(ax, [median(science_scores)], color = :magenta, label = "Science Median", linewidth=2, linestyle=:dash)

Legend(fig[1, 2], ax, "Notations")
ylims!(ax, 0, 100)

display(fig)