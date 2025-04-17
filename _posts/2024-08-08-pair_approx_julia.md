---
title: Pair approximation
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



$$
\begin{align}
p_{A,B\rightarrow B,B} = \sum_{x,y,z}\sum_{u,v,w} f(P_B - P_A) \times \frac{p_{x,A}\, p_{y,A}\,p_{z,A}\,p_{A,B}\,p_{u,B}\,p_{v,B}\,p_{w,B}}{p_A^3\,p_B^3}
\end{align}
$$

$$
\begin{align}
\dot{p}_{c,c} = \sum_{x,y,z} \, [n_c(x,y,z)+1]\,p_{d,x}\,p_{d,y}\,p_{d,z} \sum_{u,v,w} p_{c,u}\,p_{c,v}\,p_{c,w}\,f(P_c(u,v,w)-P_d(x,y,z)) \\ 
- \sum_{x,y,z} \, n_c(x,y,z)\, p_{c,x}\,p_{c,y}\,p_{c,z}\sum_{u,v,w} p_{d,u}\,p_{d,v}\,p_{d,w}\, f(P_d(u,v,w)-P_c(x,y,z))
\end{align}
$$

$$
\begin{align}
\dot{p}_{c,d} = \sum_{x,y,z} \, [1 - n_c(x,y,z)]\,p_{d,x}\,p_{d,y}\,p_{d,z} \sum_{u,v,w} p_{c,u}\,p_{c,v}\,p_{c,w}\,f(P_c(u,v,w)-P_d(x,y,z)) \\ 
- \sum_{x,y,z} \, [2 - n_c(x,y,z)]\, p_{c,x}\,p_{c,y}\,p_{c,z} \sum_{u,v,w} p_{d,u}\,p_{d,v}\,p_{d,w}\, f(P_d(u,v,w)-P_c(x,y,z))
\end{align}
$$

```
# C. Hauert, S. György, Game theory and physics, Am. J. Phys. 73, 405 (2005)

#		  x        u
#		  |        |
#  	      |        |
# y ----- A ------ B ------ v 
#		  |        |
#		  |        |
# 		  z        w
```


## Parameters

```julia
using Plots, Printf,OrdinaryDiffEq, LinearAlgebra, DelimitedFiles, PlutoUI



begin 

	const K = 0.1
	const k = 4
	const R = 1.0
	#const T = 1.1
	const P = 0.0 #not used
	const S = 0.0 #not used

	# HomotopyContinuation
	#@var ρcc ρcd
end


```
## Definitions
```julia
function W_fermi(ΔP, K)
	return 1.0 / (1.0 + exp(-ΔP / K))
end

function payoff_C(nc, R, S)
	return  (nc+1)*R + (k - nc)*S
end

function payoff_D(nc, T, P)
	return  (nc+1)*T + (k - nc)*P
end

```
## Master eq.
```julia
function calculo_pho(ρ⃗, params)
	 
	T, R, P, S, K = params
	
	eq_cc = 0.0
	eq_cd = 0.0
	
	#    ρ₁₁ ρ₁₂  -> ρdd  ρdc
	#    ρ₁₂ ρ₂₂  -> ρcd  ρcc
	
	p = [1.0-(ρ⃗[1]+2*ρ⃗[2])      ρ⃗[2]; 
		 		ρ⃗[2]  			ρ⃗[1]]
	
	for x in 0:1 # todas configuraçoes possiveis (D = 0 e C = 1)
		for y in 0:1
			for z in 0:1
				for u in 0:1
					for v in 0:1
						for w in 0:1

							nc_xyz = x + y + z 
							nc_uvw = u + v + w
	
							Pc_xyz = payoff_C(nc_xyz, R, S)
							Pc_uvw = payoff_C(nc_uvw, R, S)
							Pd_xyz = payoff_D(nc_xyz, T, P)
							Pd_uvw = payoff_D(nc_uvw, T, P)
						
							Wcd = W_fermi(Pc_uvw - Pd_xyz, K)
							Wdc = W_fermi(Pd_uvw - Pc_xyz, K)
							
							A₁ = p[1,1+x]*p[1,1+y]*p[1,1+z]*p[2,1+u]*p[2,1+v]*p[2,1+w] #ρdi  ρcj
							A₂ = p[2,1+x]*p[2,1+y]*p[2,1+z]*p[1,1+u]*p[1,1+v]*p[1,1+w] #ρci  ρdj
						
							eq_cc += (nc_xyz+1)*A₁*Wcd - nc_xyz*A₂*Wdc
							eq_cd += (1-nc_xyz)*A₁*Wcd - (2-nc_xyz)*A₂*Wdc

							#@printf "%d %d %s\n" nc_xyz nc_uvw A₁
						end
					end
				end
			end
		end
	end
	return eq_cc, eq_cd
end

```
## Soluton
```julia
const R_num = 1
const S_num = 0.
const P_num = 0
const K_num = 0.1

for T_num in 1:0.1:3
    params = [R_num; T_num; S_num; P_num; K_num]
        
    function eq_c_numeric3!(du, u, p, t)
        ρcc = u[1]
        ρcd = u[2]
        ρ⃗₀ = [ρcc; ρcd]
        du[1], du[2] = calculo_pho(ρ⃗₀, p)
    end

    u0 = [0.55,0.5] 
    tspan = (0.0, 1000.0)
    
    # Solve the ODE
    prob = ODEProblem(eq_c_numeric3!, u0, tspan, params)
    solution3 = solve(prob, Vern9())
    println("$T_num $(solution3[end][1])")
end
```