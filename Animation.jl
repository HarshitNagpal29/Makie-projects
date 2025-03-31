using Makie, GLMakie, Observables

x = range(0, 10π, 200)
phase = Observable(0.0)
y = @lift(sin.(x .- $phase))

fig = Figure()
ax = Axis(fig[1, 1], title = "Traveling Sine Wave", xlabel = "x", ylabel = "y", limits = (0, 10π, -1.5, 1.5))

lines!(ax, x, y, color = :blue, linewidth = 2)

record(fig, "sine_wave.mp4", 1:100; fps = 30) do frame 
    phase[] = 0.2 * frame
end

display(fig)