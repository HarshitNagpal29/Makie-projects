using Makie, GLMakie, CairoMakie

x = range(0, 10π, 1000)
y_sin = sin.(x)
y_cos = cos.(x)

fig = Figure()
ax = Axis(fig[1,1], title = "Sine and Cosine Functions", xlabel = "x", ylabel = "y")

lines!(ax, x, y_sin, label = "sin(x)", color = :black)
lines!(ax, x, y_cos, label = "cos(x)", color = :orange)

scatter!(ax, x, y_sin, color = :blue, markersize = 10)
scatter!(ax, x, y_cos, color = :red, markersize = 10)

Legend(fig[1, 6], ax)

display(fig)
