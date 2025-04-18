import numpy as np
import matplotlib.pyplot as plt
from coeffs import *


fig = plt.figure()
ax = fig.add_subplot(111, aspect='equal')

e = 3/5
d = 6
a = d/(2*e)
b = a*np.sqrt(1 - e**2)
are = 2*a*b
print("The area of Quadrilateral formed by vertices of Elipse",are)
print(a)
print(b)


len = 100
x_elips = np.zeros((2,len))
thetha = np.linspace(0,2*np.pi,len)
x_elips[0,:] = a*np.cos(thetha)
x_elips[1,:] = b*np.sin(thetha)

plt.plot(x_elips[0,:],x_elips[1,:],label= 'Elipse')

B1 = np.array([0,b])
B2 = np.array([0,-1*b])
A1 = np.array([a,0])
A2 = np.array([-1*a,0])

l1 = line_gen(A1,B1) 
l4 = line_gen(A1,B2) 
l3 = line_gen(A2,B2) 
l2 = line_gen(B1,A2) 
plt.plot(l1[0,:],l1[1,:],color='g',label="Quadrilateral")
plt.plot(l2[0,:],l2[1,:],color='g')
plt.plot(l3[0,:],l3[1,:],color='g')
plt.plot(l4[0,:],l4[1,:],color='g')


ax.plot()
plt.xlabel('$x$')
plt.ylabel('$y$')
plt.legend(loc='best')
plt.grid() 
plt.axis('equal')
plt.show()
