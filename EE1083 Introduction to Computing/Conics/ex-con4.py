import numpy as np
import matplotlib.pyplot as plt
from coeffs import *

fig = plt.figure()
ax = fig.add_subplot(111, aspect='equal')


C1 = np.array([0,-6])
c = 1
r = np.sqrt(((np.linalg.norm(C1)**2) + c))
print(r)

len = 1000000
x_circ = np.zeros((2,len))
thetha = np.linspace(0,2*np.pi,len)
x_circ[0,:] = r *np.cos(thetha)
x_circ[1,:] = r *np.sin(thetha)
x_circ = (x_circ.T + C1).T

len= 99
V = np.array(([0,0],[0,1]))
y = np.linspace(-10,10,len)
x = np.power(y,2)/8
P = np.vstack((x,y))
m = np.array([1,1])
c1 = 6

G = np.array([2,-4])
T = line_gen(C1,G)

# ~ H  =line_gen(T,O)
# ~ k =np.linalg.norm(T - C1)
# ~ print("The minimum distance between Parabola and Center of origin is",k)
# ~ plt.plot(H[0,:],H[1,:])

# ~ len = 1000000
# ~ x_circ1 = np.zeros((2,len))
# ~ x_circ1[0,:] = k *np.cos(thetha)
# ~ x_circ1[1,:] = r *np.sin(thetha)
# ~ x_circ1 = (x_circ.T + T).T
# ~ plt.plot(x_circ1[0,:],x_circ1[1,:])

plt.plot(P[0,:],P[1,:],label="Parabola") 
plt.plot(T[0,:],T[1,:]) 
P = P.T
plt.plot(G[0],G[1],'.')
plt.text(G[0] * (1 + 0.03), G[1] * (1 - 0.1) , 'P')
plt.plot(C1[0],C1[1],'.')
plt.text(C1[0] * (1 + 0.03), C1[1] * (1 - 0.1) , 'C1')
plt.plot(x_circ[0,:],x_circ[1,:],label="Circle")

omat = np.array(([0,1],[-1,0]))
		
ax.plot()
plt.xlabel('$x$')
plt.ylabel('$y$')
plt.legend(loc='best')
plt.grid() 
plt.axis('equal')
plt.show()
