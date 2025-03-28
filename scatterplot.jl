using Makie, GLMakie

n = 100
x = randn(n)
y = randn(n)
z = x .^ 2 .+ y .^ 2  


fig = Figure()
ax = Axis(fig[1, 1],
          title = "Random Data Scatter Plot",
          xlabel = "X",  
          ylabel = "Y")  


scat = scatter!(ax, x, y,
    color = z,
    colormap = :plasma,
    markersize = z ./ 2, 
    strokewidth = 0.5,
    strokecolor = :black
)


Colorbar(fig[1, 2], scat, label = "Intensity (z)")

xlims!(ax, -3, 3)
ylims!(ax, -3, 3)

display(fig)