import numpy as np
import matplotlib.pyplot as plt
from coeffs import *
P=np.array([-1,-2])
n=np.array([1,-1])
m=np.array([7,-1])
Q=np.array([-1,5])
N=np.vstack((n,m))
A=np.linalg.inv(N)@Q
print(A)
k=A-P
d=np.linalg.norm(k)

C=P-(d*(k/np.linalg.norm(k)))
print(C)
M=np.vstack((n,k))
G=np.array([-1,-10])
B=np.linalg.inv(M)@G
print(B)
D=2*P-B
print(D)
x_AB=line_gen(A,B)
plt.plot(x_AB[0,:],x_AB[1,:])
x_AC=line_gen(A,C)
plt.plot(x_AC[0,:],x_AC[1,:])
x_AD=line_gen(A,D)
plt.plot(x_AD[0,:],x_AD[1,:])
x_BD=line_gen(B,D)
plt.plot(x_BD[0,:],x_BD[1,:])
x_CD=line_gen(C,D)
plt.plot(x_CD[0,:],x_CD[1,:])
x_BC=line_gen(B,C)
plt.plot(x_BC[0,:],x_BC[1,:])
plt.show()
