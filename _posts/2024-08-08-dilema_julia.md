---
title: Monte Carlo simulation 
#author: cotes
date: 2024-08-08 11:33:00 +0800
categories: [Evolutionary Game Theory, Julia]
tags: [code, julia]
pin: false
math: true
mermaid: true
hidden: true
---

<hr>

[Download file](/files/scripts/julia/dilema.jl){:download}


## Packages

```julia
using OffsetArrays, StructArrays, PlutoUI, Printf, DelimitedFiles, Statistics , Random, Markdown, InteractiveUtils, Graphs, Plots, GraphPlot, Dates
```
## Initialization

### Define players

```julia
mutable struct Players
	index::Int64
    strategy::Int64
    contribution::Float64
	payoff::Float64
end
```

### Initialize players
```julia
function initialize_players(player) 
	
	for k in 0:N-1
		j=k%L
		i=k/L
		if rand() <= 0.5 # aleatório
		#if k <= N/2 # listra
		#if j>L/3 && j<2*L/3 && i>L/3 && i<2*L/3 # quadrado central
	    	player[k] = Players(k, 1, 1, 0)
		else
			player[k] = Players(k, 0, 0, 0)
		end
	end
end
```

### Define lattice
```julia
function initialize_lattice(viz) # square lattice
	
	L2 = L*L
	N = L*L

	for x in 0:N-1	
	
		viz[x,0] = x 		#self-interaction
		viz[x,1] = x - L 	#top neighbor
		viz[x,2] = x + 1 	#right neighbor
		viz[x,3] = x + L 	#botton neighbor
		viz[x,4] = x - 1 	#left neighbor
				
		if (x < L) 
			viz[x,1] = x + (L - 1) * L 		#top boundary
		end
		if (x % L == 0) 
			viz[x,4] = x + (L - 1) 			#left boundary
		end
		if (x >= L2-L) 
			viz[x,3] = x - (L - 1) * L 		#botton boundary
		end
		if ((x-L+1) % L == 0) 
			viz[x,2] = x - (L - 1) 			#right boundary
		end
	end
end
```

## Functions

### Payoff calculation
```julia
function payoff_calculation_pd(player, viz, r, x) 

	player[x].payoff = 0.
	
	R = 1.
	T = 1 + r
	S = -r
	P = 0.
	
	payoff_matrix = [
		P T
		S R
	]

	for k in 1:G-1
		player[x].payoff += 
		payoff_matrix[1+player[x].strategy, 1+player[viz[x,k]].strategy]
	end
end

function payoff_calculation_pgg(player, viz, r, x) 
	
	player[x].payoff = 0.
	
	for j in 0:G-1
		x_aux = viz[x,j]
		pool = 0
		for k in 0:G-1	
			pool += player[viz[x_aux,k]].contribution
		end
		player[x].payoff += r*pool/G - player[x].contribution	
	end
end
```

### Update rule
```julia
function update_rule(player, x, y)


    Px = player[x].payoff
    Py = player[y].payoff

	Wxy = 1.0/(1.0 + exp(-(Py-Px)/K))
	a = rand()

	if Wxy > a
	    player[x].strategy = player[y].strategy
		player[x].contribution = player[y].contribution	
	end
end
```

### Monte Carlo Step
```julia
function mcs(player, viz, r)

	for i in 0:N-1

		x = rand(0:N-1) #tem q ir de 0 a N-1
		y = rand(1:G-1) # tem q ir de 1 a 4
		vizinho = viz[x,y] 

		if player[vizinho].strategy != player[x].strategy
		
			payoff_calculation_pgg_focal(player, viz, r, x)
			payoff_calculation_pgg_focal(player, viz, r, vizinho)
			
			update_rule(player, K, x, vizinho)		
		end	
	end
end
```

### Time dynamics
```julia
function time_dynamics(player, viz, r, seed)

	for t in 1:tmax

        dens(player, t)  
	    mcs(player, viz, r)   	

    end
end
```

### Main
```julia
function main(n,r)

	viz = OffsetArray{Int64}(undef, 0:N-1, 0:G-1)
	player = OffsetArray{Players, 1}(undef, 0:N-1) 
	
	# iterations
    for i in 1:n

		aaa = now()
		seed = Int(floor(datetime2unix(aaa)))
		#seed = 12312
		Random.seed!(seed) # put number inside () to fix seed

		initialize_players(player)
		initialize_lattice(viz)
		time_dynamics(player, viz, r, seed)

    end
end
```

### Data
```julia
function dens(player, t, seed, r)
   
	dens_c = sum(player[i,j].strategy for i in 1:N)

	@printf "%d %.5f\n" t dens_c/N 

	# -----------------------------------------------------------

    function save_densities()
        directoryPath = string(@__DIR__, "/data/")
		mkpath(directoryPath)  # Create directory if it doesn't exist
        filename = @sprintf("%sdata_r%.3f_seed%d.dat",directoryPath, r, seed)
        
		open(filename, "a") do file
            dens_c = sum(player[i,j].strategy for i in 1:N)
            @printf(file, "%d %.5f\n" t dens_c/N)
        end # end the open file
    end

    save_densities()
end
```

## Run
```julia
const L=30 	# linear population size
const N=L^2 	# population size
const tmax=10^2
const G=5 		# PGG group size
const K=0.1

n = 1 # amostras
r_range = 3.3 #3.3:0.1:5.0


for r in r_range
	main(n,r)
end
```