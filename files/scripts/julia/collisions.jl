using Plots, LinearAlgebra, Printf

mutable struct Particle
    position::Vector{Float64}
    velocity::Vector{Float64}
    acceleration::Vector{Float64}
    mass::Float64
    material::String
    radius::Float64
    rigidbody::Int64
end

function initialize_particles()
    particles = Vector{Particle}(undef, num_particles)
    id = 1

    for i in 1:num_particles
        particles[id] = Particle(
            [rand()*box_size/2, rand()*box_size, rand()*box_size],          # position
            [0,0,0],                                                        # velocity
            [0.0, 0.0, 0.0],                                                # acceleration
            200.0,                                                          # mass
            "stone",                                                        # material 
            0.5,                                                              # radius
            0,                                                         	    # rigidbody
        )

        id += 1
    end

    return particles
end

function apply_gravity!(particles)
    for i in 1:length(particles)
        if particles[i].material == "stone"
            
            # Gravity 
            Fi_gravity = particles[i].mass * [0.0, 0.0, -10]  

            particles[i].velocity .+= (Fi_gravity / particles[i].mass) .* dt
            particles[i].position .+= particles[i].velocity * dt
        end
    end
end

function calculate_colision!(particle1,particle2)

    # elastic colision with restitution
    # m1 v1 + m2 v2 = m1 v1' + m2 v2'
    # C = |v2' - v1'|/|v2 - v1|

    r_vec = particle1.position - particle2.position
    r = norm(r_vec)

    if r < particle1.radius + particle2.radius && r >= 0.0001

        x1 = particle1.position
        x2 = particle2.position
        v1 = particle1.velocity
        v2 = particle2.velocity
        m1 = particle1.mass
        m2 = particle2.mass

        normal = (x1 - x2) / r
        overlap = particle1.radius + particle2.radius - r
        total_mass = m1 + m2
        particle1.position .+= overlap * normal * (m2 / total_mass)
        particle2.position .-= overlap * normal * (m1 / total_mass)

        r = particle1.radius + particle2.radius
        dv1 = - (1 + colision_restitution_coefficient) * m2 / (m1 + m2) * dot(v1 - v2, x1 - x2) * (x1 - x2) / r^2
        dv2 = - (1 + colision_restitution_coefficient) * m1 / (m1 + m2) * dot(v2 - v1, x2 - x1) * (x2 - x1) / r^2
        particle1.velocity .+= dv1
        particle2.velocity .+= dv2

        if particle1.material == "stone" || particle2.material == "stone"
            #@printf "%s vel=%s %s vel=%s\n" particle1.material string(dv1) particle2.material string(dv2) 
        end
        
    end
end

function apply_boundary_conditions!(particles)
    
    for p in particles

        # X boundaries
        if p.position[1] < p.radius
            p.position[1] = p.radius
            p.velocity[1] *= -damping  
        elseif p.position[1] > box_size - p.radius
            p.position[1] = box_size - p.radius
            p.velocity[1] *= -damping  
        end
        
        # Y boundaries
        if p.position[2] < p.radius
            p.position[2] = p.radius
            p.velocity[2] *= -damping  
        elseif p.position[2] > box_size - p.radius
            p.position[2] = box_size - p.radius
            p.velocity[2] *= -damping  
        end
        
        # Z boundaries 
        if p.position[3] < p.radius
            p.position[3] = p.radius
            p.velocity[3] *= -damping  
        elseif p.position[3] > box_size - p.radius
            p.position[3] = box_size - p.radius
            p.velocity[3] *= -damping  
        end
    end
end

function calculate_colisions!(particles)
    for i in 1:length(particles)
        for j in i+1:length(particles)
            calculate_colision!(particles[i],particles[j])
        end
    end
end

function simulate_step!(particles)
    apply_gravity!(particles)
    calculate_colisions!(particles)
    apply_boundary_conditions!(particles)
end

function visualize_sph(particles, step)
    x = [p.position[1] for p in particles]
    y = [p.position[2] for p in particles]
    z = [p.position[3] for p in particles]

    markersizes = [p.radius * 20 for p in particles]  

    colors = []
    for p in particles
        color_map = Dict(
            "sand" => :yellow,
            "air" => :gray,
            "stone" => :blue
        )
        push!(colors, get(color_map, p.material, :black))
    end

    plt = scatter3d(x, y, z,
            markersize=markersizes,  
            markercolor=colors,
            xlim=(0, box_size),
            ylim=(0, box_size),
            zlim=(0, box_size),
            title="Time $(round(step, digits=2))s",
            xlabel="Y", ylabel="X", zlabel="Z",
            legend=false,
            camera=(30, 60),
            size=(400, 500),
            alpha=0.7
    )
    
    return plt
end

# world
const num_particles = 100

const tmax = 100.0
const dt = 0.05
const box_size = 10.0
const damping = 0.0


# colision
const colision_restitution_coefficient = 0.0
const gravity_coef = 0.1

function main()
    particles = initialize_particles()
    
    t = 0.0
    frame_count = 0
    save_interval = max(1, round(Int, 0.01 / dt))
    
    while t < tmax
        
        if frame_count % save_interval == 0  # Save every X frame
            plt = visualize_sph(particles, t)
            display(plt)
            sleep(0.1)  
        end
        simulate_step!(particles)
        t += dt
        frame_count += 1
    end
end

main()