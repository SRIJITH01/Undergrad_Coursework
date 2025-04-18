import numpy as np
import math
J1=1
J2=J3=2
J4=16
D=32
T_stall=5
e_a=5
w_noload=600/math.pi*math.pi/30
N1=N3=10
N2=N4=20
Jm=J1+((J2+J3)*(N1/N2)**2)+(J4*((N1*N3)/(N2*N4))**2)
Dm=D*((N1*N3)/(N2*N4))**2
A=T_stall/e_a #A=k_t/R_a
K_b=e_a/w_noload
L=float((A/Jm)*((N1*N3)/(N2*N4)))
M=float((Dm+(A*K_b))/Jm)
s="s"

#G_s=((A/Jm)/(s*(s+((Dm+(A*K_b))/Jm)))*((N1*N3)/(N2*N4)))  #G(s)=theta_2/E(s)=theta_s/E(s)(N1*N4/N2*N4),
print("Jm=",Jm)
print("Dm=",Dm)
print("K_t/R_a=",A)
print("K_b=",K_b)
print("G(s)=",str(L)+"/"+s+"("+s+"+"+str(M)+")")
