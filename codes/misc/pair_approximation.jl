### A Pluto.jl notebook ###
# v0.17.5

using Markdown
using InteractiveUtils

# ╔═╡ 01a96222-3f68-11ed-0fe8-a381b1b62085
md"""
# Pair approximations
"""

# ╔═╡ a639b57c-d05f-40ff-85c6-ef3efa717da8
#		  x        u
#		  |        |
#  	      |        |
# y ----- A ------ B ------ v 
#		  |        |
#		  |        |
# 		  z        w

# ╔═╡ e4ea2a31-9370-46e1-9de1-f95e259048e4
begin
	const x = 1
	const y = 2
	const z = 3
	const u = 4
	const v = 5
	const w = 6
	const G = 5
	estado = zeros(2)
	estado[1]=0
	estado[2]=1
end

# ╔═╡ fc79fbfa-495e-451e-8256-8289f9991a05
estado  # vizinho[sitio][estado]

# ╔═╡ cfdbf9ff-e1ef-40d7-bb00-03477a998b6e
md"""
```math
p_{A,B\rightarrow B,B} = \sum_{x,y,z}\sum_{u,v,w} f(P_B - P_A) \times \frac{p_{x,A}\, p_{y,A}\,p_{z,A}\,p_{A,B}\,p_{u,B}\,p_{v,B}\,p_{w,B}}{p_A^3\,p_B^3}
```
"""

# ╔═╡ aef9b0ff-93c5-4481-8fa0-3c633cbb4b85
md"""
```math
\begin{split}
\dot{p}_{c,c} = \sum_{x,y,z} \, [n_c(x,y,z)+1]\,p_{d,x}\,p_{d,y}\,p_{d,z} \sum_{u,v,w} p_{c,u}\,p_{c,v}\,p_{c,w}\,f(P_c(u,v,w)-P_d(x,y,z)) \\ 
- \sum_{x,y,z} \, n_c(x,y,z)\, p_{c,x}\,p_{c,y}\,p_{c,z}\sum_{u,v,w} p_{d,u}\,p_{d,v}\,p_{d,w}\, f(P_d(u,v,w)-P_c(x,y,z))
\end{split}
```
"""

# ╔═╡ f0c06ed5-4afe-4c80-9c8d-3872e8f97c9d
md"""
```math
\begin{split}
\dot{p}_{c,d} = \sum_{x,y,z} \, [1 - n_c(x,y,z)]\,p_{d,x}\,p_{d,y}\,p_{d,z} \sum_{u,v,w} p_{c,u}\,p_{c,v}\,p_{c,w}\,f(P_c(u,v,w)-P_d(x,y,z)) \\ 
- \sum_{x,y,z} \, [2 - n_c(x,y,z)]\, p_{c,x}\,p_{c,y}\,p_{c,z} \sum_{u,v,w} p_{d,u}\,p_{d,v}\,p_{d,w}\, f(P_d(u,v,w)-P_c(x,y,z))
\end{split}
```
"""

# ╔═╡ 92db8477-bb80-4c25-82af-dff4ca6cb0e0
function f(ΔP, K)
	return 1.0/(1.0+exp(-ΔP/K))
end

# ╔═╡ 380125db-e6fe-4795-8ba6-e4a09653b52b
function payoff_c(nc,r,c,G)
	return r*c*(nc+1)/G - c # +1 due to the C itself 
end

# ╔═╡ 596d6594-1b71-41f3-a080-dca910c4f76b
function payoff_d(nc,r,c,G)
	return r*c*nc/G
end

# ╔═╡ 2323d95d-5b8d-4e18-a414-a913566ed360
function calculo_pho(r, c, G, K)
	
	eq_cc = 0.0
	eq_cd = 0.0
	pho₁ = 0;
	pho₂ = 0;
	
	for x in 1:2 # todas configuraçoes possiveis
		for y in 1:2
			for z in 1:2
				for u in 1:2
					for v in 1:2
						for w in 1:2

							nc_xyz = estado[x] + estado[y] + estado[z] 
							nc_uvw =  estado[u] + estado[v] + estado[w]
							#pho₁ += vizinho[i,1]
							#pho₂ += vizinho[i,2]
	
							payc_xyz = PGG_c_payoff(numc_xyz,r,c,G) 
							payc_uvw = PGG_c_payoff(numc_uvw,r,c,G) 
							payd_xyz = PGG_d_payoff(numc_xyz,r,c,G) 
							payd_uvw = PGG_d_payoff(numc_uvw,r,c,G) 
						
							fΔPcd = f(payc_uvw - payd_xyz, K)
							fΔPdc = f(payd_uvw - payc_xyz, K)
							
							A₁ = pho₁
							A₂ = pho₂
						
							eq_cc += (numc_xyz+1)*A₁*fΔPcd - numc_xyz*A₂*fΔPdc
							eq_cd += (1-numc_xyz)*A₁*fΔPcd - (2-numc_xyz)*A₂*fΔPdc
						end
					end
				end
			end
		end
	end
	return eq_cc, eq_cd
end

# ╔═╡ b50b6a27-d7ed-4672-9260-b71c41a60863
function diagrama()

	for r in 1:1:5
		eq_cc, eq_cd = calculo_rho()
	end
end
	

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.7.1"
manifest_format = "2.0"

[deps]
"""

# ╔═╡ Cell order:
# ╟─01a96222-3f68-11ed-0fe8-a381b1b62085
# ╠═a639b57c-d05f-40ff-85c6-ef3efa717da8
# ╠═e4ea2a31-9370-46e1-9de1-f95e259048e4
# ╠═fc79fbfa-495e-451e-8256-8289f9991a05
# ╟─cfdbf9ff-e1ef-40d7-bb00-03477a998b6e
# ╟─aef9b0ff-93c5-4481-8fa0-3c633cbb4b85
# ╟─f0c06ed5-4afe-4c80-9c8d-3872e8f97c9d
# ╠═92db8477-bb80-4c25-82af-dff4ca6cb0e0
# ╠═380125db-e6fe-4795-8ba6-e4a09653b52b
# ╠═596d6594-1b71-41f3-a080-dca910c4f76b
# ╠═2323d95d-5b8d-4e18-a414-a913566ed360
# ╠═b50b6a27-d7ed-4672-9260-b71c41a60863
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
