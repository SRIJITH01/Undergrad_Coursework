import numpy as np
import matplotlib.pyplot as plt

A=np.array([2.5,0])
B=np.array([0,10/3])
C=np.array([-5/8,0])
D=np.array([0,-5/6])
len=10
x_AB=np.zeros((2,len))
lam=np.linspace(0,1,len)
for i in range(len):
 temp1=A+lam[i]*(B-A)
 x_AB[:,i]=temp1.T
 
x_CD=np.zeros((2,len))
lam=np.linspace(0,1,len)
for i in range(len):
 temp1=C+lam[i]*(D-C)
 x_CD[:,i]=temp1.T

plt.plot(x_AB[0,:],x_AB[1,:],label='$AB$')
plt.grid()

plt.plot(x_CD[0,:],x_CD[1,:],label='$CD$')
plt.grid()

plt.plot(A[0],A[1],'o')
plt.text(A[0]*(1+0.1),A[1]*(1),'A')

plt.plot(B[0],B[1],'o')
plt.text(B[0]*(1-0.2),B[1]*(1),'B')


plt.plot(C[0],C[1],'o')
plt.text(C[0]*(1+0.1),C[1]*(1-0.1),'C')

plt.plot(D[0],D[1],'o')
plt.text(D[0]*(1-0.1),D[1]*(1),'D')

plt.show()
