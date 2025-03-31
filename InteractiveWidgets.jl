using Makie, GLMakie, Observables

frequency = Observable(1.0)
amplitude = Observable(1.0)

fig = Figure(size = (800, 400))
ax = Axis(fig[1, 1], title = "Interactive Sine Wave", xlabel = "x", ylabel = "y")

slider_grid = fig[2, 1] = GridLayout()

freq_slider = Slider(slider_grid[1, 1], range = 0.1:0.1:5, startvalue = 1)
Label(slider_grid[1, 2], "Frequency")

amp_slider = Slider(slider_grid[2, 1], range = 0.1:0.1:5, startvalue = 1)
Label(slider_grid[2, 2], "Amplitude")

on(freq_slider.value) do val
    frequency[] = val
end

on(amp_slider.value) do val
    amplitude[] = val
end

x = range(0, 4π, 100)
y = @lift($amplitude .* sin.($frequency .* x))
lines!(ax, x, y, color = :blue, linewidth = 2)

xlims!(ax, 0, 4π)
ylims!(ax, -5, 5)

display(fig)