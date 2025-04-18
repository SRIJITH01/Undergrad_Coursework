import numpy as np
import matplotlib.pyplot as plt
from coeffs import *
P=np.array([-2,4])
Q=np.array([0,2])
m=np.array([0,1])
n=(Q-P)/2
N=np.vstack((m,n))
M=np.array([m@Q,-4])
O=np.linalg.inv(N)@M
print(O)
