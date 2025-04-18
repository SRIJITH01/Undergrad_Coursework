import numpy as np
import matplotlib.pyplot as plt
import math
from coeffs import *

#setting up plot
fig = plt.figure()
ax = fig.add_subplot(111, aspect='equal')

lrct = 3
len=100
y  = np.linspace(-5,5,len)
x = np.power(y,2)/3
P1 = np.vstack((x,y))
x_par1 = P1
plt.plot(x_par1[0,:],x_par1[1,:],label="Parabola1")

x  = np.linspace(-5,5,len)
y = np.power(x,2)/3
P2 = np.vstack((x,y))
x_par2 = P2
plt.plot(x_par2[0,:],x_par2[1,:],label="Parabola2")

D = np.array([-3/8,-3/8])
m = np.array([1,-1])
T = line_dir_pt(m,D,-5,5)

plt.plot(T[0,:],T[1,:],label='Common Tangent' )

ax.plot()
plt.xlabel('$x$')
plt.ylabel('$y$')
plt.legend(loc='best')
plt.axis('equal')
plt.grid()
plt.show()
