using GLMakie, Makie, CairoMakie, Random

sinc(x) = x == 0 ? 1.0 : sin(π * x) / (π * x)

x = range(-3,3,length=100)
y = range(-3,3,length=100)
z = [sinc(xi)*sinc(yi) for xi in x, yi in y]

fig =Figure()
ax = Axis(fig[1,1], title = "sinc(x) ⋅ sinc(y)", xlabel= "X", ylabel = "Y")

hm = heatmap!(ax, x, y, z, colormap = :viridis, interpolate = true)
Colorbar(fig[1, 2], hm, label = "Intensity")

contour!(ax, x, y, z, levels=5, color = :red, linewidth = 1.5)

display(fig)