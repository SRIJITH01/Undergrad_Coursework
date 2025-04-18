import numpy as np
import matplotlib.pyplot as plt
from coeffs import *
O1=np.array([2,-3])
O2=np.array([-3,2])
r1=np.sqrt(O1.T@O1+12)
e=O1-O2
d=np.linalg.norm(e)
r2=np.sqrt((d*d)+(r1*r1))
print(r1)

len = 100
theta = np.linspace(0,2*np.pi,len)
x_circ = np.zeros((2,len))
x_circ[0,:] = r1*np.cos(theta)
x_circ[1,:] = r1*np.sin(theta)
x_circ = (x_circ.T + O1).T
plt.plot(x_circ[0,:],x_circ[1,:],label='$C_1$')

len = 100
theta = np.linspace(0,2*np.pi,len)
x_circ = np.zeros((2,len))
x_circ[0,:] = r2*np.cos(theta)
x_circ[1,:] = r2*np.sin(theta)
x_circ = (x_circ.T + O2).T
plt.plot(x_circ[0,:],x_circ[1,:],label='$C_2$')
plt.axis('equal')
plt.xlabel('$x$');plt.ylabel('$y$')
plt.legend(loc='best');plt.grid()
plt.show()
