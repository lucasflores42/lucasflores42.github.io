---
title: Dilemma (julia version)
#author: cotes
date: 2019-08-08 11:33:00 +0800
categories: [Evolutionary Game Theory, simulations]
tags: [code, C]
pin: false
math: true
mermaid: true
hidden: true
---



<hr>

Main code to run simulations about evolutionary game theory.



```julia
### A Pluto.jl notebook ###
# v0.19.40

using Markdown
using InteractiveUtils

# ╔═╡ 75ed1ecd-0115-44a0-aec8-bc5dd3e22cd7
begin
import Pkg
import Pluto
end

# ╔═╡ 504368cf-e365-4c7b-bce7-b11fb8d766fb
# ╠═╡ show_logs = false
begin
Pkg.add("Plots"); 			using Plots
Pkg.add("OffsetArrays"); 	using OffsetArrays
Pkg.add("StructArrays"); 	using StructArrays
Pkg.add("PlutoUI"); 		using PlutoUI
Pkg.add("Interact"); 		using Interact
Pkg.add("PythonPlot")	
								using Printf
								using DelimitedFiles
end

# ╔═╡ 29afd940-0492-11ed-14c5-9b6822172378
md"""
								Evolutionary Game Theory
"""

# ╔═╡ 2e800abd-70af-4eec-8766-364ecba54703
# run on terminal with 
# 	julia /home/lucasflores/julia-1.10.2/codes/code.jl

# ╔═╡ 44d7b895-2dae-4618-b798-f2d40a2250d6
begin
pythonplot()
Plots.PythonPlotBackend()
end

# ╔═╡ b5c0aaa5-0486-490b-a504-02ebd19ec5bf
PlutoUI.TableOfContents(title="", aside=true)

# ╔═╡ aade2c70-f06d-4715-8def-a25fe47c3877
md"""
# Parameters
"""

# ╔═╡ 6954d1df-93e0-4bfa-83a2-08963f60da03
begin
	N=100^2
	tmax=10^1
	RUIDO=0.1
	L=100
	G=5
	r = 4.96
end

# ╔═╡ 722aa8c5-e6e2-47e2-84e5-ca778456f048
md"""
## Lattice
"""

# ╔═╡ 1a66cd2e-a472-492f-9f86-7f5287f67b6d
md"""
## Definitions
"""

# ╔═╡ b311a948-73ec-40ff-94bf-1531b02e4936
md"""
# Functions
"""

# ╔═╡ a8b9b962-df5c-41f8-b151-83054f8c2fd0
md"""
## Player properties
"""

# ╔═╡ f5cdbbdc-5a18-43b8-986d-1d240800a70c
mutable struct Players
	index::Int64
    strategy::Int64
    neighborhood::Int64
    contribution::Float64
	payoff::Float64
end

# ╔═╡ 9fa114af-d524-479e-9b91-02e3bf794548
begin
	# neighborhood matrix
	viz = OffsetArray{Int64}(undef, 0:N-1, 0:G-1)

	# create an uninitialized 1D array of size `N` of structs
	player = OffsetArray{Players, 1}(undef, 0:N-1) 
	
	dens_c = Array{Float64}(undef, tmax)
	dens_d = Array{Float64}(undef, tmax)
end

# ╔═╡ 9756598e-4fd3-458c-a9d8-962389f4edb1
function square_lattice(L)

	L2 = L*L
	N  = L*L

	for x = 0:N-1	
	
		viz[x,0] = x 		#self-interaction
		viz[x,1] = x - L 	#top neighbor
		viz[x,2] = x + 1 	#right neighbor
		viz[x,3] = x + L 	#botton neighbor
		viz[x,4] = x - 1 	#left neighbor
				
		if(x < L) viz[x,1] = x + (L - 1) * L 			#top boundary
		end
		if(x % L == 0) viz[x,4] = x + (L - 1) 			#left boundary
		end
		if(x >= L2-L) viz[x,3] = x - (L - 1) * L 		#botton boundary
		end
		if((x-L+1) % L == 0) viz[x,2] = x - (L - 1) 	#right boundary
		end
	end

end


# ╔═╡ 6bfcace1-1675-4e06-bbc3-a65bda00fdc8
md"""
## Initial condition
"""

# ╔═╡ e6b9608e-612c-4182-9aa3-65bda889b4c6
function initialize_players()
	
	for i = 0:N-1
		if rand((0,1)) == 1 
	    	player[i] = Players(i, 1, G, 1, 0)
		else
			player[i] = Players(i, 0, G, 0, 0)
		end
	end
	
end

# ╔═╡ 1249cca0-a199-47f1-84da-c0c647362b1d
md"""
## Payoff calculation
"""

# ╔═╡ 0ff53c58-4201-4caf-a06c-2255204dc51a
function payoff_calculation_pd(x) 

	player[x].payoff = 0.
	
	R = 1
	T = 2
	S = 4
	P = 0
	
	payoff_matrix = [
		P T
		S R
	]
	
	for k = 1:G-1
	player[x].payoff += payoff_matrix[1+player[x].strategy, 1+player[viz[x,k]].strategy]
	end

end

# ╔═╡ d7ae5b41-a165-4402-8c10-70e936c53daa
function payoff_calculation_pgg(x,r) 
	
	player[x].payoff = 0.
	
	for j = 0:G-1
		x_aux = viz[x,j]
		pool = 0
		for k = 0:G-1	
			pool += player[viz[x_aux,k]].contribution
		end
		player[x].payoff += (1/G)*r*pool - player[x].contribution	
	end
	
end

# ╔═╡ 2ac0a78e-8a1b-42f3-b1d0-cbbcc3916256
md"""
## Strategy adoption
"""

# ╔═╡ 7b49025e-96d3-4df0-814c-1466d83c91ac
function update_rule(x,y)

	Wxy = 1.0/(1.0 + exp(-(player[y].payoff-player[x].payoff)/RUIDO))

	if(Wxy > rand())	   
	player[x].strategy = player[y].strategy
	player[x].neighborhood = player[y].neighborhood
	player[x].contribution = player[y].contribution	
	end
	
end

# ╔═╡ 3e53d864-e7f1-4a34-a660-200a630d4dac
md"""
## Monte Carlo Step
"""

# ╔═╡ 1359847e-37d7-4711-8dec-857102711018
function mcs(r)
	
	for i = 0:N-1
		x = round(Int, (N-1)*rand() )	#tem q ir de 0 a N-1
		y = 1 + round(Int, (G-2)*rand() ) # tem q ir de 1 a 4
		vizinho = viz[x,y] 
		
		if player[vizinho].strategy != player[x].strategy

		# payoff calculation of x
		payoff_calculation_pgg(x,r)

		# payoff calculation of neighbor	
		payoff_calculation_pgg(vizinho,r)
		
		update_rule(x,vizinho)		
		end
	end
	
end

# ╔═╡ 4564d00c-189e-4584-8fdd-ddbf289cd9b9
md"""
## Density calculation
"""

# ╔═╡ b78f46af-04a5-4eec-91ca-2ab07a99381f
function dens(t)

	for i = 0:N-1
		if player[i].strategy == 1 
		dens_c[t] += 1
		end
		if player[i].strategy == 0 
		dens_d[t] += 1
		end
	end
	
	dens_c[t] = dens_c[t]/N
	dens_d[t] = dens_d[t]/N

	#with_terminal() do 
    #    println("t=$t C=$dens_c D=$dens_d")
	#end

end


# ╔═╡ 96b781f7-cd18-42c9-a090-b3c3e546729c
function save_data(i)

	t=1:tmax
	filename=@sprintf("teste%d.dat", i)
	writedlm(filename,[t dens_c dens_d])
	
end

# ╔═╡ b82f4ba3-a8e2-434b-b2ef-59f657530ec4
function time_dynamics_plot(x, y; plt=nothing)

	theme(:default)
    if plt === nothing
        plt = plot(legend=:false, ylims=(0, 1.01), title="Time dynamics", xlabel="t", xscale=:log10, xlims=(1e-0, tmax), framestyle=:box)
    end
	
    plot!(plt, [x], [y], marker=(:circle, 2), show=true)  # Modify the existing plot
	
    #display(plt)
	#sleep(0.1)

end

# ╔═╡ 49744b2f-8338-420f-8896-a039e2951820
function heatmap_plot(t)
	theme(:default)
	#matrix = OffsetArray{Int64}(undef, 0:L-1, 0:L-1)
	matrix = zeros(Int64, L, L)
	
	for i = 0:L-1
		for j = 0:L-1
			matrix[i+1,j+1] = player[j+i*L].strategy
		end
	end

	heatmap(matrix, c=:viridis, colorbar=false, title="t = $t", show=false)
	#display(heatmap(matrix, c=:viridis, colorbar=false, title="t = $t"))
	#sleep(0.1)
	
end

# ╔═╡ cf0f1e8f-e2e6-4581-b6e1-14c495238042
md"""
# Main
"""

# ╔═╡ 25591749-e541-467a-b2d1-897e7acd85f5
# ╠═╡ show_logs = false
begin

	# iterations
	for i in 1:1
		
		plt = nothing  # Initialize plt
		dens_c .= 0
		dens_d .= 0
		
		initialize_players()
		square_lattice(L)

		# time evolution
		for t = 1:tmax
			
			dens(t)
			mcs(r)

			# only works on terminal
			plt = time_dynamics_plot(t, dens_c[t], plt=plt) 
			plt2 = heatmap_plot(t)
		    
			display(plot(plt, plt2, layout=(1,2)))
			sleep(10^-5)		
		end
	
	save_data(i)
		
	end	
	
end

# ╔═╡ 223199e2-fa7a-4c70-9ef5-cdd000668886
md"""
# Plot file
"""

# ╔═╡ abb364b7-d858-4192-9ffb-7f4afb45efa4
# ╠═╡ show_logs = false
begin

	theme(:dark)
	test = plot(legend=:topleft, ylims=(0, 1.1), title="dens C por distribuiçao", xlabel="t", xscale=:log10, xlims=(1e-0, tmax), framestyle=:box)

	for i = 1:10
	    file = "/home/lucasflores/julia-1.10.2/codes/teste$i.dat"
	    f = readdlm(file)
	    plot!(test,f[:, 1], f[:, 2], label="file", marker=(:circle, 0))
	end
	
	#savefig("teste.png")
	#test
end

# ╔═╡ 6a6e6257-8ec7-4765-8131-7a600c4bd2e0


# ╔═╡ Cell order:
# ╟─29afd940-0492-11ed-14c5-9b6822172378
# ╠═2e800abd-70af-4eec-8766-364ecba54703
# ╠═75ed1ecd-0115-44a0-aec8-bc5dd3e22cd7
# ╠═504368cf-e365-4c7b-bce7-b11fb8d766fb
# ╠═44d7b895-2dae-4618-b798-f2d40a2250d6
# ╠═b5c0aaa5-0486-490b-a504-02ebd19ec5bf
# ╟─aade2c70-f06d-4715-8def-a25fe47c3877
# ╠═6954d1df-93e0-4bfa-83a2-08963f60da03
# ╟─722aa8c5-e6e2-47e2-84e5-ca778456f048
# ╠═9756598e-4fd3-458c-a9d8-962389f4edb1
# ╟─1a66cd2e-a472-492f-9f86-7f5287f67b6d
# ╠═9fa114af-d524-479e-9b91-02e3bf794548
# ╟─b311a948-73ec-40ff-94bf-1531b02e4936
# ╟─a8b9b962-df5c-41f8-b151-83054f8c2fd0
# ╠═f5cdbbdc-5a18-43b8-986d-1d240800a70c
# ╟─6bfcace1-1675-4e06-bbc3-a65bda00fdc8
# ╠═e6b9608e-612c-4182-9aa3-65bda889b4c6
# ╟─1249cca0-a199-47f1-84da-c0c647362b1d
# ╠═0ff53c58-4201-4caf-a06c-2255204dc51a
# ╠═d7ae5b41-a165-4402-8c10-70e936c53daa
# ╟─2ac0a78e-8a1b-42f3-b1d0-cbbcc3916256
# ╠═7b49025e-96d3-4df0-814c-1466d83c91ac
# ╟─3e53d864-e7f1-4a34-a660-200a630d4dac
# ╠═1359847e-37d7-4711-8dec-857102711018
# ╟─4564d00c-189e-4584-8fdd-ddbf289cd9b9
# ╠═b78f46af-04a5-4eec-91ca-2ab07a99381f
# ╠═96b781f7-cd18-42c9-a090-b3c3e546729c
# ╠═b82f4ba3-a8e2-434b-b2ef-59f657530ec4
# ╠═49744b2f-8338-420f-8896-a039e2951820
# ╟─cf0f1e8f-e2e6-4581-b6e1-14c495238042
# ╠═25591749-e541-467a-b2d1-897e7acd85f5
# ╟─223199e2-fa7a-4c70-9ef5-cdd000668886
# ╠═abb364b7-d858-4192-9ffb-7f4afb45efa4
# ╟─6a6e6257-8ec7-4765-8131-7a600c4bd2e0

```
[Download file](/files/scripts/egt.jl){:download}