import numpy as np
import matplotlib.pyplot as plt
from coeffs import *


fig = plt.figure()
ax = fig.add_subplot(111, aspect='equal')


omat = np.array([[0,1],[-1,0]])
n_1 = np.array([4,3])
n_2 = np.array([3,4])
c_1 = np.array([12])
c_2 = np.array([12])
O = np.array([0,0])

m1 = omat@n_1
m2 = omat@n_2
V = np.vstack((n_1,n_2))
C = np.vstack((c_1,c_2))

P = np.linalg.inv(V)@C
P = P.reshape(2,)

for i in range(1,10):
	m = np.array([-1*i,1])
	l = line_dir_pt(m,P,-1*P[0]/m[0],-1*P[1]/m[1])
	plt.plot(l[0,:],l[1,:])

x = np.array([1,0])
y = np.array([0,1])
x_1 = line_dir_pt(x,O,-10,10)
y_1 = line_dir_pt(y,O,-10,10)
lg_1 = line_dir_pt(m1,P,-2,2)
lg_2 = line_dir_pt(m2,P,-2,2)

plt.plot(lg_1[0,:],lg_1[1,:],label=" Line_1")
plt.plot(lg_2[0,:],lg_2[1,:],label=" Line_2")
plt.plot(x_1[0,:],x_1[1,:])
plt.plot(y_1[0,:],y_1[1,:])



ax.plot()
plt.xlabel('$x$')
plt.ylabel('$y$')
plt.legend(loc='best')
plt.grid() 
plt.axis('equal')
plt.show()
