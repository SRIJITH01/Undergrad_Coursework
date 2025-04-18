import numpy as np
import matplotlib.pyplot as plt
from coeffs import *
k=2
A=np.array([k,3*k])
B=np.array([5,k])
C=np.array([-k,2])
m=B-C
n=A-C
N=np.vstack((m,n))
Q=np.array([m@A,n@B])
O=np.linalg.inv(N)@Q
print(O)
x_AB=line_gen(A,B)
plt.plot(x_AB[0,:],x_AB[1,:])
x_BC=line_gen(B,C)
plt.plot(x_BC[0,:],x_BC[1,:])
x_CA=line_gen(C,A)
plt.plot(x_CA[0,:],x_CA[1,:])
x_AO=line_gen(A,O)
plt.plot(x_AO[0,:],x_AO[1,:])
x_BO=line_gen(B,O)
plt.plot(x_BO[0,:],x_BO[1,:])
x_CO=line_gen(C,O)
plt.plot(x_CO[0,:],x_CO[1,:])
plt.plot(A[0], A[1], 'o')
plt.text(A[0] * (1 + 0.1), A[1] * (1 - 0.1) , 'A')
plt.plot(B[0], B[1], 'o')
plt.text(B[0] * (1 - 0.2), B[1] * (1) , 'B')


plt.plot(C[0], C[1], 'o')
plt.text(C[0] * (1 + 0.1), C[1] * (1 - 0.1) , 'C')
plt.plot(O[0], O[1], 'o')
plt.text(O[0] * (1 - 0.2), O[1] * (1) , 'O')
plt.show()
