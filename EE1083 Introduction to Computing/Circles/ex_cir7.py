import numpy as np
import matplotlib.pyplot as plt
from coeffs import *
P=np.array([1,-1])
m=np.array([2,1])
n=np.array([1,-1])
N=np.vstack((m,n))
Q=np.array([3,1])
O=np.linalg.inv(N)@Q
print(O)
I=P+np.array([4,-1])

k=O-P
r=np.linalg.norm(k)
len = 100
theta = np.linspace(0,2*np.pi,len)
x_circ = np.zeros((2,len))
x_circ[0,:] = r*np.cos(theta)
x_circ[1,:] = r*np.sin(theta)
x_circ = (x_circ.T + O).T
plt.plot(x_circ[0,:],x_circ[1,:],label='$C_1$')
plt.plot(O[0], O[1], 'o')
plt.text(O[0] * (1 + 0.1), O[1] * (1 - 0.1) , 'O')
plt.plot(P[0], P[1], 'o')
plt.text(P[0] * (1 + 0.1), P[1] * (1 - 0.1) , 'P')
plt.plot(I[0], I[1], 'o')
plt.text(I[0] * (1 + 0.1), I[1] * (1 - 0.1) , 'I')
x_PI=line_gen(P,I)
plt.plot(x_PI[0,:],x_PI[1,:])
x_PO=line_gen(P,O)
plt.plot(x_PO[0,:],x_PO[1,:])
x_OI=line_gen(O,I)
plt.plot(x_OI[0,:],x_OI[1,:])
plt.axis('equal')
plt.xlabel('$x$');plt.ylabel('$y$')
plt.legend(loc='best');plt.grid()
plt.show()
