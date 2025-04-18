import numpy as np
import matplotlib.pyplot as plt
from coeffs import *
A=np.array([2,3])
B=np.array([4,5])
C=(A+B)/2
m=A-B
n=np.array([-1,4])
N=np.vstack((m,n))
Q=np.array([m.T@C,3])
O=np.linalg.inv(N)@Q
print(O)
d=O-A
r=np.linalg.norm(d)
print(r)
len = 100
theta = np.linspace(0,2*np.pi,len)
x_circ = np.zeros((2,len))
x_circ[0,:] = r*np.cos(theta)
x_circ[1,:] = r*np.sin(theta)
x_circ = (x_circ.T + O).T
plt.plot(x_circ[0,:],x_circ[1,:],label='$C_1$')
x_AB=line_gen(A,B)
plt.plot(x_AB[0,:],x_AB[1,:])
x_CO=line_gen(C,O)
plt.plot(x_CO[0,:],x_CO[1,:])
x_AO=line_gen(A,O)
plt.plot(x_AO[0,:],x_AO[1,:])
x_BO=line_gen(B,O)
plt.plot(x_BO[0,:],x_BO[1,:])
plt.plot(A[0], A[1], 'o')
plt.text(A[0] * (1 + 0.1), A[1] * (1 - 0.1) , 'A')
plt.plot(B[0], B[1], 'o')
plt.text(B[0] * (1 - 0.2), B[1] * (1) , 'B')
plt.plot(C[0], C[1], 'o')
plt.text(C[0] * (1 + 0.1), C[1] * (1 - 0.1) , 'C')
plt.plot(O[0], O[1], 'o')
plt.text(O[0] * (1 + 0.1), O[1] * (1 - 0.1) , 'O')
plt.axis('equal')
plt.xlabel('$x$');plt.ylabel('$y$')
plt.legend(loc='best');plt.grid()
plt.show()
