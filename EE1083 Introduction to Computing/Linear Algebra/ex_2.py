import numpy as np
import matplotlib.pyplot as plt
from coeffs import *

P=([1,2])
n=([1,-1])
omat = np.array([[0,1],[-1,0]]) 
m=omat@n
d=2*np.sqrt(3)
Q=P+(d*(m/np.linalg.norm(m)))

print (Q)
R=np.array(3-np.sqrt(6))
x_QR=line_gen(Q,R)
plt.plot(x_QR[0,:],x_QR[1,:])
plt.show()
