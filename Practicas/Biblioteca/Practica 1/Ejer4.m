%Ejer4

%la integral se puede obtener con la recurrencia X_0=e-1, x_n=e-nx_{n-1}
clc
format long g
x_0=e-1
x_n=x_0
for k=1:1:25
  printf(mat2str(k));printf(": ")
  
  x_n=e-(k*x_n)
  printf("\n")
  
 
endfor
printf(" \n valor final: ")
x_n