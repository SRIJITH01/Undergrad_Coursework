from mpl_toolkits.mplot3d import Axes3D
import matplotlib.pyplot as plt
from funcs import *
import numpy as np
import math
m = -(np.sqrt(3))/2#=A.T@B
a=1#=np.linalg.norm(A)
b=1#=np.linalg.norm(B)
k=m/(a*b)
theta=math.acos(k)*180/np.pi
print (theta)
#defining lines : x(k) = A + k*l
O = np.array([0,0,0]).reshape((3,1))
l1 = np.genfromtxt("A.dat").reshape((3,1))
O = np.array([0,0,0]).reshape((3,1))
l2 = np.array([np.sqrt(3)/2,0.5,0]).reshape((3,1))
#creating x,y for 3D plotting
len = 10
xx, yy = np.meshgrid(range(len), range(len))
#setting up plot
fig = plt.figure()
ax = fig.add_subplot(111,projection='3d')
O = np.array([0,0,0]).reshape((3,1))
l3= np.array([-np.sqrt(3)/2,1/2,0]).reshape((3,1))
A = np.genfromtxt("A.dat").reshape((3,1))
B = np.array([-np.sqrt(3)/2,1/2,0]).reshape((3,1))
C = np.array([np.sqrt(3)/2,0.5,0]).reshape((3,1))
l1_p = line_dir_pt(l1,O)
l2_p = line_dir_pt(l2,O)
l3_p = line_dir_pt(l3,O)
z=xx*0
ax.scatter(O[0],O[1],O[2],'o',label="Point O")
ax.scatter(A[0],A[1],A[2],'o',label="Point A")
ax.scatter(C[0],C[1],C[2],'o',label="Point C")
ax.scatter(B[0],B[1],B[2],'o',label="Point B")
#ax.plot_surface(xx, yy, z, color='r',alpha=1)

#plotting line
plt.plot(l1_p[0,:],l1_p[1,:],l1_p[2,:],label="Line L1")
plt.plot(l2_p[0,:],l2_p[1,:],l2_p[2,:],label="Line L2")
plt.plot(l3_p[0,:],l3_p[1,:],l3_p[2,:],label="Line L3")

#corresponding z for planes
#plotting planes

#show plot
plt.xlabel('$x$');plt.ylabel('$y$')
plt.legend(loc='best');plt.grid()
plt.show()
