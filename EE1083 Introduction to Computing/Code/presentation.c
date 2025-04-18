#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "coeffs.h"
int  main() //main function begins
{
double**B=createMat(3,1);
B[0][0]=-sqrt(3)/2;B[1][0]=0.5;B[2][0]=0;
printf("B=\n");savetxt(B,"B.dat",3,1);
print(B,3,1);
double**C=createMat(3,1);
C[0][0]=sqrt(3)/2;C[1][0]=0.5;C[2][0]=0;
printf("C=\n");savetxt(C,"C.dat",3,1);
print(C,3,1);//Let P be parallel to A ,so P=C+qB, q comes out to be -1
double **P=linalg_sub(C, B, 3, 1);
printf("P=\n");
print(P,3,1);
double m=linalg_norm(P, 3);
double s=1/m;
double **A=linalg_scalmatmul(P, s,3, 1);
printf("A=\n");
print(A,3,1);savetxt(A,"A.dat",3,1);

	// calculating x with A^TB=-sqrt(3)/
	const double AB=-cbrt(0.75);
	const double a=1;
	const double b=1;
	double  x;

    x = AB/a*b;
    printf( "x=%lf ",x);
    
    // constant PI is defined
    const double PI =  3.1415926;
    double  result;
     result = acos(x);
    printf("Inverse of cos(%.2f) = %.2lf in radians\n", x ,result);
    // converting radians to degree
    result = acos(x)*180/PI;
    printf("Inverse of cos(%.2f) = %.2lf in degrees\n", x, result);
    // paramter not in range
    x = 1.2;
    result = acos(x);
    printf("Inverse of cos(%.2f) = %.2lf", x, result);
  
    return 0;
}



