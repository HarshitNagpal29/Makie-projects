using WGLMakie, Makie, CairoMakie, Random

months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun",
          "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]

sales = rand(50:200,12)
errors = rand(5:15,12)

fig = Figure(size = (800, 400)) 
ax = Axis(fig[1,1], title = "Monthly Sales (2025)", xlabel= "Month", ylabel = "Sales (\$)", xticks = (1:12, months), xticklabelsize = 20)

barplot!(ax, 1:12, sales, color = :blue, strokecolor = :black, strokewidth = 1)

errorbars!(ax, 1:12, sales, errors, direction = :y, color = :orange, linewidth = 2)

ylims!(ax, 0, 250)
ax.ygridcolor = (:gray, 0.2)

display(fig)