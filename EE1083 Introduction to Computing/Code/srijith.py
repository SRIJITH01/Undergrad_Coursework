import numpy as np
import math
import matplotlib.pyplot as plt
from coeffs import *
O=np.array([0,0])
r=np.sqrt(9)
P=np.array([4,7])
p=np.linalg.norm(P)
F=np.eye(2)
E=(np.sqrt((p*p)-(r*r))/r)*omat+F
Q1=np.linalg.inv(E)@P
print(Q1)
I=-(np.sqrt((p*p)-(r*r))/r)*omat+F
Q2=np.linalg.inv(I)@P
x_PQ1=line_gen(P,Q1)
plt.plot(x_PQ1[0,:],x_PQ1[1,:])
x_PO=line_gen(P,O)
plt.plot(x_PO[0,:],x_PO[1,:])
x_OQ1=line_gen(O,Q1)
plt.plot(x_OQ1[0,:],x_OQ1[1,:])
x_PQ2=line_gen(P,Q2)
plt.plot(x_PQ2[0,:],x_PQ2[1,:])
x_OQ2=line_gen(O,Q2)
plt.plot(x_OQ2[0,:],x_OQ2[1,:])
len = 100
theta = np.linspace(0,2*np.pi,len)
x_circ = np.zeros((2,len))
x_circ[0,:] = r*np.cos(theta)
x_circ[1,:] = r*np.sin(theta)
x_circ = (x_circ.T + O).T
plt.plot(x_circ[0,:],x_circ[1,:],label='$C_1$')
plt.plot(P[0], P[1], 'o')
plt.text(P[0] * (1 + 0.1), P[1] * (1 - 0.1) , 'P')
plt.plot(Q1[0], Q1[1], 'o')
plt.text(Q1[0] * (1 + 0.1), Q1[1] * (1 - 0.1) , 'Q1')
plt.plot(O[0], O[1], 'o')
plt.text(O[0] * (1 + 0.1), O[1] * (1 - 0.1) , 'O')
plt.plot(Q2[0], Q2[1], 'o')
plt.text(Q2[0] * (1 + 0.1), Q2[1] * (1 - 0.1) , 'Q2')
plt.axis('equal')
plt.grid()
plt.show()

