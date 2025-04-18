import numpy as np
import matplotlib.pyplot as plt
from coeffs import *
O=np.array([-1,2])
r=np.sqrt(O.T@O+4)
print(r)
P=np.array([2,2])
H=(2*P)-O
h=3
len = 100
theta = np.linspace(0,2*np.pi,len)
x_circ = np.zeros((2,len))
x_circ[0,:] = r*np.cos(theta)
x_circ[1,:] = r*np.sin(theta)
x_circ = (x_circ.T + O).T
plt.plot(x_circ[0,:],x_circ[1,:],label='$C_1$')

x2_circ = np.zeros((2,len))
x2_circ[0,:] = h*np.cos(theta)
x2_circ[1,:] = h*np.sin(theta)
x2_circ = (x2_circ.T + H).T
plt.plot(x2_circ[0,:],x2_circ[1,:],label='$C_2$')
plt.plot(O[0], O[1], 'o')
plt.text(O[0] * (1 + 0.1), O[1] * (1 - 0.1) , 'O')
plt.plot(H[0], H[1], 'o')
plt.text(H[0] * (1 + 0.1), H[1] * (1 - 0.1) , 'H')



# Solve the quadratic equation ax**2 + bx + c = 0

# import complex math module
import cmath
L=np.array([1,0])
l=np.linalg.norm(L)
a = (l*l)
b = -(2*(L.T@H))
t= np.linalg.norm(H)
c=(t*t)-(h*h)
# To take coefficient input from the users
# a = float(input('Enter a: '))
# b = float(input('Enter b: '))
# c = float(input('Enter c: '))

# calculate the discriminant
d = (b**2) - (4*a*c)

# find two solutions
sol1 = (-b-cmath.sqrt(d))/(2*a)
sol2 = (-b+cmath.sqrt(d))/(2*a)

print('The solution are {0} and {1}'.format(sol1,sol2))

M=sol1*L
N=sol2*L
x_MN=line_gen(M,N)
plt.plot(x_MN[0,:],x_MN[1,:])
plt.plot(M[0], M[1], 'o')
plt.text(M[0] * (1 + 0.1), M[1] * (1 - 0.1) , 'M')
plt.plot(N[0], N[1], 'o')
plt.text(N[0] * (1 - 0.2), N[1] * (1) , 'N')
plt.axis('equal')
plt.xlabel('$x$');plt.ylabel('$y$')
plt.legend(loc='best');plt.grid()
plt.show()
