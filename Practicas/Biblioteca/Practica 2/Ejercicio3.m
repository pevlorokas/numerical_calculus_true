clear all
close all
clc
format long

d_sen=@(x,h) (sin(x+h)-sin(x))/h;

for k=1:1:16
  h=1/(10.^k);
  printf("Para k = ")
  printf(mat2str(k))
  printf("\n")
  
  resultado=d_sen(1.2,h);
  
  printf("Valor: ")
  printf(mat2str(resultado))
  printf("\n")
  
  
  printf("ERROR ABSOLUTO: ")
  e_abs=abs(d_sen(1.2,h)-cos(1.2));
  printf(mat2str(e_abs))
  printf("\n")
  
  
  printf("ERROR RELATIVO: ")
  e_rel=e_abs/resultado;
  printf(mat2str(e_rel))
  printf("\n")
  
  printf("Segunda derivada con lo que dice el apartado: ")
  dd_sen=(-sin(1.2)./2).*h;
  printf(mat2str(dd_sen))
  
  printf("\n \n")
  
  
endfor

e_rel=@(x,h) abs(d_sen(x,h)-cos(x));
##
##h=linspace(-20,0,200)
##loglog(h,e_rel(1.2,1./10.^h))

i=-20:0.5:0;
h=10.^i; % %Valores de h variando entre 10^(-20) y 1
##h1=linspace(-20,0,200)
##h1_1 = 10.^h1
figure(1)
loglog(h,e_rel(1.2, h));

hold off

figure(2)
x3_1=linspace(0,pi,200);
for k=1:2:15
  h=1/(10.^k);
  
  plot(x3_1,d_sen(x3_1,h));
  hold on
  
endfor

plot(x3_1,cos(x3_1))




