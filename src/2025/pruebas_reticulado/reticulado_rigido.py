import numpy as np
import matplotlib.pyplot as plt
import matplotlib.animation as animation
from scipy.integrate import solve_ivp

# Constants
m1 = 4   # Massless junction point approximation (can be small value)
m2 = 3   # Mass attached to the second spring
k1 = 60.0  # Spring constant of first spring (N/m)
k2 = 60.0  # Spring constant of second spring (N/m)
c1 = 3   # Damping force spring 1
c2 = 3   # Damping force spring 2
g = 9.81   # Gravity (m/s^2)
Fc = 5.0   # Constant external force (N)

def two_spring_system_damping(t, y):
    x1, v1, x2, v2 = y
    
    # dx0dt = v0
    # dx1dt = v1 
    # dv0dt = (-k1*x0 + m2*(x1 - x0) - c1*v0 + c2*(v1 - v0) + m1*g) / m1 # d/dt (v0) = ( -k1 )
    # dv1dt = (-m2*(x1 - x0) - c2*(v1 - v0) + m2*g) / m2
    
    dx1dt = v1
    dx2dt = v2
    ddx1ddt = (-k1*x1 -c1*x1 + m1*g + k2*(x2-x1) + c2*(v2-v1) )*1/m1 
    ddx2ddt = (m2*g + k2*(x1-x2)+ c2*(v1-v2))*1/m2
    
    return [dx1dt, ddx1ddt, dx2dt, ddx2ddt]

# Define system of equations
def two_spring_system1(t, y):
    x1, v1, x2, v2 = y
    
    dx1dt = v1
    dv1dt = (-k1*x1 + k2*(x2 - x1)) / m1
    dx2dt = v2
    dv2dt = (-k2*(x2 - x1) + m2*g + Fc) / m2
    
    return [dx1dt, dv1dt, dx2dt, dv2dt]

# Initial conditions
x1_0 = 0.0   # Initial displacement of junction point
v1_0 = 0.0   # Initial velocity of junction point
x2_0 = 2  # Initial displacement of the mass
v2_0 = 0.0   # Initial velocity of the mass

y0 = [x1_0, v1_0, x2_0, v2_0]

# Time range
t_span = (0, 10)
t_eval = np.linspace(0, 10, 1000)

# Solve ODEs
sol = solve_ivp(two_spring_system_damping, t_span, y0, t_eval=t_eval)

# Extract solutions
x1_sol, x2_sol = sol.y[0], sol.y[2]

# Animation setup
fig, ax = plt.subplots(figsize=(5, 8))
ax.set_xlim(-0.5, 0.5)
ax.set_ylim(-2, 2)
ax.set_title("Two-Spring System Animation")
ax.set_xlabel("Position")
ax.set_ylabel("Height")

# Draw elements
spring1, = ax.plot([0, 0], [0, x1_0], 'b-', lw=2)
spring2, = ax.plot([0, 0], [x1_0, x2_0], 'g-', lw=2)
mass1 = ax.scatter(0, x2_0, color='red', s=100)
mass2 = ax.scatter(0, x1_0, color='red', s=100)

# Update function for animation
def update(frame):
    x1 = x1_sol[frame]
    x2 = x2_sol[frame]
    
    spring1.set_ydata([0, x1])
    spring2.set_ydata([x1, x2])
    mass1.set_offsets([0, x2])  # Correctly update scatter position
    mass2.set_offsets([0, x1])  # Correctly update scatter position

    
    return spring1, spring2, mass1, mass2

ani = animation.FuncAnimation(fig, update, frames=len(t_eval), interval=0.25, blit=True)
plt.show()
