using Makie, GLMakie

u = range(0, 4π, 100)
v = range(0, 4π, 50)

x = [(2 + cos(ui)) * cos(vj) for ui in u, vj in v]
y = [(2 + cos(ui)) * sin(vj) for ui in u, vj in v]
z = [(ui + sin(ui)) for ui in u, vj in v]

fig = Figure(size = (800, 600))
ax = LScene(fig[1, 1], show_axis = true)

surf = surface!(ax, x, y, z, colormap = :viridis, shading = FastShading, diffuse = 0.7, specular = 0.3)

zoom!(ax.scene, 0.7)
rotate!(ax.scene, Vec3f(1, 0, 0), 0.5)

cb = Colorbar(fig[1, 2], surf, label = "Z-value")


display(fig)