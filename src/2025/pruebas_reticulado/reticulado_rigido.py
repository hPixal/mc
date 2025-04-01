import numpy as np
import matplotlib.pyplot as plt
import matplotlib.animation as animation
from scipy.integrate import solve_ivp

# Constants
m1 = 0.5   # Massless junction point approximation (can be small value)
m2 = 1.0   # Mass attached to the second spring
k1 = 50.0  # Spring constant of first spring (N/m)
k2 = 30.0  # Spring constant of second spring (N/m)
c1 = 0.5   # Clamping force spring 1
c2 = 0.3   # Clamping force spring 2
g = 9.81   # Gravity (m/s^2)
Fc = 5.0   # Constant external force (N)

# Define system of equations
def two_spring_system(t, y):
    x1, v1, x2, v2 = y
    
    dx1dt = v1
    dv1dt = (-k1*x1 + k2*(x2 - x1)) / m1
    dx2dt = v2
    dv2dt = (-k2*(x2 - x1) + m2*g + Fc) / m2
    
    return [dx1dt, dv1dt, dx2dt, dv2dt]

# Initial conditions
x1_0 = 0.0   # Initial displacement of junction point
v1_0 = 0.0   # Initial velocity of junction point
x2_0 = 0.1  # Initial displacement of the mass
v2_0 = 0.0   # Initial velocity of the mass

y0 = [x1_0, v1_0, x2_0, v2_0]

# Time range
t_span = (0, 10)
t_eval = np.linspace(0, 10, 1000)

# Solve ODEs
sol = solve_ivp(two_spring_system, t_span, y0, t_eval=t_eval)

# Extract solutions
x1_sol, x2_sol = sol.y[0], sol.y[2]

# Animation setup
fig, ax = plt.subplots(figsize=(5, 8))
ax.set_xlim(-0.5, 0.5)
ax.set_ylim(-1, 5)
ax.set_title("Two-Spring System Animation")
ax.set_xlabel("Position")
ax.set_ylabel("Height")

# Draw elements
spring1, = ax.plot([0, 0], [0, x1_0], 'b-', lw=2)
spring2, = ax.plot([0, 0], [x1_0, x2_0], 'g-', lw=2)
mass = ax.scatter(0, x2_0, color='red', s=100)

# Update function for animation
def update(frame):
    x1 = x1_sol[frame]
    x2 = x2_sol[frame]
    
    spring1.set_ydata([0, x1])
    spring2.set_ydata([x1, x2])
    mass.set_offsets([0, x2])  # Correctly update scatter position
    
    return spring1, spring2, mass

ani = animation.FuncAnimation(fig, update, frames=len(t_eval), interval=0.5, blit=True)
plt.show()
