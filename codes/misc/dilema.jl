### A Pluto.jl notebook ###
# v0.17.5

using Markdown
using InteractiveUtils

# ╔═╡ 75ed1ecd-0115-44a0-aec8-bc5dd3e22cd7
begin
import Pkg
import Pluto
end

# ╔═╡ 504368cf-e365-4c7b-bce7-b11fb8d766fb
begin
Pkg.add("Plots")
Pkg.add("OffsetArrays")
Pkg.add("StructArrays")
Pkg.add("PlutoUI")
end

# ╔═╡ 0cb8a865-9d19-4713-98c8-2784956cf807
begin
using Plots
using OffsetArrays
using StructArrays
using Printf
using DelimitedFiles
end

# ╔═╡ 29afd940-0492-11ed-14c5-9b6822172378
md"""
								Focal Public Goods Game
"""

# ╔═╡ 722aa8c5-e6e2-47e2-84e5-ca778456f048
md"""
# Lattice
"""

# ╔═╡ 1a66cd2e-a472-492f-9f86-7f5287f67b6d
md"""
# Initial Conditions
"""

# ╔═╡ a8b9b962-df5c-41f8-b151-83054f8c2fd0
md"""
# Player properties
"""

# ╔═╡ f5cdbbdc-5a18-43b8-986d-1d240800a70c
mutable struct Players
	index::Int64
    state::Int64
    neighborhood::Int64
    contribution::Float64
	payoff::Float64
end

# ╔═╡ 9fa114af-d524-479e-9b91-02e3bf794548
begin
	N=100^2
	tmax=1000
	RUIDO=0.1
	L=100
	G=7

	#r = 
	#investimento = [0 for i in 1:N]
	viz = OffsetArray{Int64}(undef, 0:N-1, 0:G-1)
	dens_c =  Array{Float64}(undef, tmax)
	dens_d = Array{Float64}(undef, tmax)
	# create an uninitialized 1D array of size `N` of structs
	player = Array{Players, 1}(undef, N) 
end

# ╔═╡ 9756598e-4fd3-458c-a9d8-962389f4edb1
function triangular_lattice(L)
	
	L2 = L*L;
	N  = L2;
	
	for x = 0:N-1	

		viz[x,0] = x 				# self-interaction
		viz[x,1] = x - L 			#top neighbor
		viz[x,2] = x + 1 			#right neighbor
		viz[x,3] = x + L			#botton neighbor
		viz[x,4] = x - 1 			#left neighbor
		viz[x,5] = x - L + 1 		#top-right neighbor
		viz[x,6] = x - 1 + L 		#botton-left neighbor


		if(x % (L2) < L) #top boundary
			viz[x,1] = x + (L - 1) * L
			viz[x,5] = x + (L - 1) * L + 1
		end
		
		if(x % L == 0) #left boundary
			viz[x,4] = x + (L - 1)
			viz[x,6] = x + (L - 1) + L
		end
		
		if(x % (L2) >= L2-L) #botton boundary
			viz[x,3] = x - (L - 1) * L
			viz[x,6] = x - (L - 1) * L - 1
		end
		
		if((x-L+1) % L == 0) #right boundary
			viz[x,2] = x - (L - 1)
			viz[x,5] = x - (L - 1) - L
		end
		
		if(x == L-1) #top-right vertice
			viz[x,5] = L * L - L 
		end
		
		if(x == L2-L) #botton-left vertice
			viz[x,6] = L - 1
		end
	end
end

# ╔═╡ e6b9608e-612c-4182-9aa3-65bda889b4c6
function initialize_players()
	
	for i = 1:N
	    player[i] = Players(i, rand((0,1)), G, 0, 0)
	end
	
end

# ╔═╡ 6edd6c87-cd53-4cd4-9f9c-2da086aa7090
md"""
# Plot densidades
"""

# ╔═╡ 32ec3c61-e8ff-4090-9b37-17d3bead6eb1
function dens(t)

	for i = 1:N
		if player[i].state == 1 
		dens_c[t] += 1
		end
		if player[i].state == 0 
		dens_d[t] += 1
		end
	end
	dens_c[t] = dens_c[t]/N
	dens_d[t] = dens_d[t]/N

	#with_terminal() do 
    #    println("t=$t C=$dens_c D=$dens_d")
	#end

end


# ╔═╡ 1249cca0-a199-47f1-84da-c0c647362b1d
md"""
# Payoff calculation
"""

# ╔═╡ d7ae5b41-a165-4402-8c10-70e936c53daa
function pool(x,r) # x de 0 a N-1; indice na matriz é um a menos no indice do struct
	pool = 0
	for k = 0:player[x+1].neighborhood-1
		pool += player[viz[x,k]+1].contribution*player[viz[x,k]+1].state
	end
	player[x+1].payoff = (1/player[x+1].neighborhood)*r*pool - player[x+1].contribution*player[x+1].state;

end

# ╔═╡ 2ac0a78e-8a1b-42f3-b1d0-cbbcc3916256
md"""
# Strategy adoption
"""

# ╔═╡ 7b49025e-96d3-4df0-814c-1466d83c91ac
function update_rule(x,y)

	Wxy = 1.0/(1.0 + exp(-(player[y].payoff-player[x].payoff)/RUIDO));

	if(Wxy > rand())	   
	player[x].state = player[y].state
	player[x].neighborhood = player[y].neighborhood
	player[x].contribution = player[y].contribution	
	end
	
end

# ╔═╡ 3e53d864-e7f1-4a34-a660-200a630d4dac
md"""
# Monte Carlo Step
"""

# ╔═╡ 1359847e-37d7-4711-8dec-857102711018
function mcs(r)
	
	for i = 1:N
		x = 1 + round(Int, (N-1)*rand() )	#tem q ir de 1 a N
		y = 1 + round(Int, (player[x].neighborhood-2)*rand() ) # tem q ir de 1 a 4
		vizinho = viz[x-1,y] + 1;
		
		if player[vizinho].state != player[x].state
		pool(x-1,r)
		pool(vizinho-1,r)
		update_rule(x,vizinho)		
		end
	end
	
end

# ╔═╡ f092581f-7019-4526-996e-685a216f54fa
md"""
# Time evolution
"""

# ╔═╡ 6d5088a7-130f-40b2-9500-27a6645c4e59
function time_evolution()
	
	initialize_players()
	triangular_lattice(L)
	dens_c .= 0
	dens_d .= 0
	r = 3.6
		
	for k in 1:N
		player[k].contribution = rand(Normal(11,10))
	end

	for t = 1:tmax
		dens(t)
		mcs(r)
	end

end

# ╔═╡ 9b239c0d-e2b3-4b79-8298-c5b3cb99eb94
md"""
# Salva em arquivo
"""

# ╔═╡ 6df3bbed-f4e6-4e16-a09a-e9b87c9b9339
begin
t=1:tmax
	for i in 1:10
		filename=@sprintf("teste%d.dat", i)
		writedlm(filename,[t dens_c dens_d])
	end
end

# ╔═╡ 223199e2-fa7a-4c70-9ef5-cdd000668886
md"""
# Plot evoluçao temporal
"""

# ╔═╡ abb364b7-d858-4192-9ffb-7f4afb45efa4
begin
	for i in 1:1
		file = raw"/home/skynet/investimento/quadrada01.txt"
		f = readdlm(file)
		x = 1:tmax
		plot!(f[:,1], f[:,4],marker=(:circle,5) ,legend=:topleft , ylims = (0,1.1),title = "dens C por distribuiçao", label = "c = 1")
	end
	xlabel!("r")

end

# ╔═╡ bddaeb63-4200-4a06-ab13-608b4a6afd68


# ╔═╡ Cell order:
# ╟─29afd940-0492-11ed-14c5-9b6822172378
# ╠═75ed1ecd-0115-44a0-aec8-bc5dd3e22cd7
# ╠═504368cf-e365-4c7b-bce7-b11fb8d766fb
# ╠═0cb8a865-9d19-4713-98c8-2784956cf807
# ╟─722aa8c5-e6e2-47e2-84e5-ca778456f048
# ╠═9756598e-4fd3-458c-a9d8-962389f4edb1
# ╟─1a66cd2e-a472-492f-9f86-7f5287f67b6d
# ╠═9fa114af-d524-479e-9b91-02e3bf794548
# ╟─a8b9b962-df5c-41f8-b151-83054f8c2fd0
# ╠═f5cdbbdc-5a18-43b8-986d-1d240800a70c
# ╠═e6b9608e-612c-4182-9aa3-65bda889b4c6
# ╟─6edd6c87-cd53-4cd4-9f9c-2da086aa7090
# ╠═32ec3c61-e8ff-4090-9b37-17d3bead6eb1
# ╟─1249cca0-a199-47f1-84da-c0c647362b1d
# ╠═d7ae5b41-a165-4402-8c10-70e936c53daa
# ╟─2ac0a78e-8a1b-42f3-b1d0-cbbcc3916256
# ╠═7b49025e-96d3-4df0-814c-1466d83c91ac
# ╟─3e53d864-e7f1-4a34-a660-200a630d4dac
# ╠═1359847e-37d7-4711-8dec-857102711018
# ╟─f092581f-7019-4526-996e-685a216f54fa
# ╠═6d5088a7-130f-40b2-9500-27a6645c4e59
# ╟─9b239c0d-e2b3-4b79-8298-c5b3cb99eb94
# ╠═6df3bbed-f4e6-4e16-a09a-e9b87c9b9339
# ╟─223199e2-fa7a-4c70-9ef5-cdd000668886
# ╠═abb364b7-d858-4192-9ffb-7f4afb45efa4
# ╠═bddaeb63-4200-4a06-ab13-608b4a6afd68
