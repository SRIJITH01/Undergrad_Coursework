import numpy as np
import matplotlib.pyplot as plt
from coeffs import *
n=np.array([1,1])
m=np.array([1,-1])
N=np.vstack((n,m))
Q=np.array([2,0])
F=np.linalg.inv(N)@Q
print(F)
C=-(2*F)
print(C)
k=C-F
d=np.linalg.norm(k)
a=(2/np.sqrt(3))*d
M=(a*d)/2
print(M)
b=a/2
A=F-(b*(m/np.linalg.norm(m)))
B=F+(b*(m/np.linalg.norm(m)))
G=(B+C)/2
O=np.array([0,0])
x_GA=line_gen(G,A)
plt.plot(x_GA[0,:],x_GA[1,:])
x_AB=line_gen(A,B)
plt.plot(x_AB[0,:],x_AB[1,:])
x_BC=line_gen(B,C)
plt.plot(x_BC[0,:],x_BC[1,:])
x_CA=line_gen(C,A)
plt.plot(x_CA[0,:],x_CA[1,:])
x_FC=line_gen(F,C)
plt.plot(x_FC[0,:],x_FC[1,:])
plt.plot(A[0], A[1], 'o')
plt.text(A[0] * (1 + 0.1), A[1] * (1 - 0.1) , 'A')
plt.plot(B[0], B[1], 'o')
plt.text(B[0] * (1 - 0.2), B[1] * (1) , 'B')


plt.plot(C[0], C[1], 'o')
plt.text(C[0] * (1 + 0.1), C[1] * (1 - 0.1) , 'C')
plt.plot(F[0], F[1], 'o')
plt.text(F[0] * (1 - 0.2), F[1] * (1) , 'F')
plt.plot(G[0], G[1], 'o')
plt.text(G[0] * (1 + 0.1), G[1] * (1 - 0.1) , 'G')
plt.plot(O[0], O[1], 'o')
plt.text(O[0] * (1 + 0.1), O[1] * (1 - 0.1) , 'O')

plt.show()
