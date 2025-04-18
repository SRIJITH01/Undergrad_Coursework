import numpy as np
import matplotlib.pyplot as plt
from coeffs import *
theta=np.pi/6
k=np.array([np.cos(theta),-np.sin(theta)])
j=np.array([np.sin(theta),np.cos(theta)])
T=np.vstack((k,j))
A=np.array([0,0])
B=np.array([2,0])
C=np.array([2,2])
D=np.array([0,2])
Q=T@(A+B+C+D)
n=np.array([1,0])
d=n@Q
print(d)
x_AB=line_gen(A,B)
plt.plot(x_AB[0,:],x_AB[1,:])
x_BC=line_gen(B,C)
plt.plot(x_BC[0,:],x_BC[1,:])
x_CD=line_gen(C,D)
plt.plot(x_CD[0,:],x_CD[1,:])
x_DA=line_gen(D,A)
plt.plot(x_DA[0,:],x_DA[1,:])
E=T@A
F=T@B
G=T@C
H=T@D
x_EF=line_gen(E,F)
plt.plot(x_EF[0,:],x_EF[1,:])
x_FG=line_gen(F,G)
plt.plot(x_FG[0,:],x_FG[1,:])
x_GH=line_gen(G,H)
plt.plot(x_GH[0,:],x_GH[1,:])
x_HE=line_gen(H,E)
plt.plot(x_HE[0,:],x_HE[1,:])
plt.plot(A[0], A[1], 'o')
plt.text(A[0] * (1 + 0.1), A[1] * (1 - 0.1) , 'A')
plt.plot(B[0], B[1], 'o')
plt.text(B[0] * (1 - 0.2), B[1] * (1) , 'B')


plt.plot(C[0], C[1], 'o')
plt.text(C[0] * (1 + 0.1), C[1] * (1 - 0.1) , 'C')
plt.plot(D[0], D[1], 'o')
plt.text(D[0] * (1 - 0.2), D[1] * (1) , 'D')
plt.plot(E[0], E[1], 'o')
plt.text(E[0] * (1 + 0.2), E[1] * (1-0.2),'E')

plt.plot(F[0], F[1], 'o')
plt.text(F[0] * (1 - 0.2), F[1] * (1) , 'F')


plt.plot(G[0], G[1], 'o')
plt.text(G[0] * (1 + 0.1), G[1] * (1 - 0.1) , 'G')
plt.plot(H[0], H[1], 'o')
plt.text(H[0] * (1 - 0.2), H[1] * (1) , 'H')
plt.show()
