import numpy as np
import math
import matplotlib.pyplot as plt
from coeffs import *
O=np.array([0,0])
r=np.sqrt(9)
P=np.array([4,7])
F=np.eye(2)
E=(np.sqrt((P.T@P)-(r*r))/r)*omat+F
Q=np.linalg.inv(E)@P

x_PQ=line_gen(P,Q)
plt.plot(x_PQ[0,:],x_PQ[1,:])
x_PO=line_gen(P,O)
plt.plot(x_PO[0,:],x_PO[1,:])
x_OQ=line_gen(O,Q)
plt.plot(x_OQ[0,:],x_OQ[1,:])
len = 100
theta = np.linspace(0,2*np.pi,len)
x_circ = np.zeros((2,len))
x_circ[0,:] = r*np.cos(theta)
x_circ[1,:] = r*np.sin(theta)
x_circ = (x_circ.T + O).T
plt.plot(x_circ[0,:],x_circ[1,:],label='$C_1$')
plt.plot(P[0], P[1], 'o')
plt.text(P[0] * (1 + 0.1), P[1] * (1 - 0.1) , 'P')
plt.plot(Q[0], Q[1], 'o')
plt.text(Q[0] * (1 + 0.1), Q[1] * (1 - 0.1) , 'Q')
plt.plot(O[0], O[1], 'o')
plt.text(O[0] * (1 + 0.1), O[1] * (1 - 0.1) , 'O')
h=P-Q
print(h)
plt.axis('equal')
plt.xlabel('$x$');plt.ylabel('$y$')
plt.legend(loc='best');plt.grid()
plt.show()
