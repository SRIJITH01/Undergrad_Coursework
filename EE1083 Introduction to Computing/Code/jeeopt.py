import numpy as np
import matplotlib.pyplot as plt
coeffs=[1,-9,20]#given condition x*x-9x+20<=0
M=np.roots(coeffs)#s2<x<s1
print(np.roots(coeffs))
s1=M.T@np.array([1,0])#s1=5
s2=M.T@np.array([0,1])#s2=4
cur_x = 1 # The algorithm starts at x=4
gamma = 0.01 # step size multiplier
precision = 0.00001
previous_step_size = 1 
max_iters = 10000 # maximum number of iterations
iters = 0 #iteration counter

df = lambda x: 6*x**2 - 30*x+36
while (previous_step_size > precision) & (iters < max_iters):
    prev_x = cur_x
    cur_x += gamma * df(prev_x)
    previous_step_size = abs(cur_x - prev_x)
    iters+=1

print("f'(x)=0 at", cur_x)
k1=cur_x

cur_x = s2 # The algorithm starts at x=1
gamma = 0.01 # step size multiplier
precision = 0.00001
previous_step_size = 1 
max_iters = 10000 # maximum number of iterations
iters = 0 #iteration counter

df = lambda x: 6*x**2 - 30*x+36
while (previous_step_size > precision) & (iters < max_iters):
    prev_x = cur_x
    cur_x -= gamma * df(prev_x)
    previous_step_size = abs(cur_x - prev_x)
    iters+=1

print("f'(x)=0 at", cur_x)
k2=cur_x 
df2= lambda x: 2*x**3-15*x**2+36*x-48
if s2<k2<s1 or s2<k1<s1 :
	print("the local maximum is ",max(df2(k1),df2(k2)))
else :
	a=df2(4)
	b=df2(5)
	if a>b:
		print("f(4) is maximum,f(4)=",a)
	else  :	
		print("f(5) is maximum,f(5)=",b)

#Plotting f(x)
x = np.linspace(-4,8,50)#points on the x axis
f=2*x**3-15*x**2+36*x-48#Objective function
plt.plot(x,f,color=(1,0,1))
plt.grid()
plt.xlabel('$x$')
plt.ylabel('$f(x)$')


plt.show()#Reveals the plot

