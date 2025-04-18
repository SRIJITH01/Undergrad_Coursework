import numpy as np
import matplotlib.pyplot as plt
from coeffs import *
O=np.array([1,0])
r=(O.T@O)
m=np.array([1,-1])
n=np.array([1,1])
c=3
n=n.reshape((2,1))
m=m.reshape((2,1))

R1 = ((m@m.T-n@n.T)/(m.T@m+n.T@n))@O
print(R1)
R2 = c*n/np.linalg.norm(n)
R2=R2.reshape((1,2))
R = 2*(R1+R2)
R = np.array(R)[0]
print(R)
len=100
theta = np.linspace(0,2*np.pi,len)
x_circ = np.zeros((2,len))
x_circ[0,:] = r*np.cos(theta)
x_circ[1,:] = r*np.sin(theta)
x_circ = (x_circ.T + R).T
plt.plot(x_circ[0,:],x_circ[1,:],label='$C_1$')
plt.plot(R[0], R[1], 'o')
plt.text(R[0] * (1 + 0.1), R[1] * (1 - 0.1) , 'R')
len=100
theta = np.linspace(0,2*np.pi,len)
x_circ = np.zeros((2,len))
x_circ[0,:] = r*np.cos(theta)
x_circ[1,:] = r*np.sin(theta)
x_circ = (x_circ.T + O).T
plt.plot(x_circ[0,:],x_circ[1,:],label='$C_2$')
A = np.array([3,0]) 
B = np.array([0,3]) 

x_AB=line_gen(A,B)
plt.plot(x_AB[0,:],x_AB[1,:])
plt.axis('equal')
plt.xlabel('$x$');plt.ylabel('$y$')
plt.legend(loc='best');plt.grid()
plt.show()
