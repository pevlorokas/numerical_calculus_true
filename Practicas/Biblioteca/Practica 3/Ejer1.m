clc 
clear all
addpath('./Biblioteca')

x1=[1.5,2.7,3.1,-2.1,-6.6,11.0]
y1=[0.0,1.0,-0.5,1.0,0.5,0.0]

polyinterpolador(interpolNewton(x1,y1),x1)

x1_1=linspace(-7,11,200);

function y = creaPol(coef,x)
  sum=0;
  for k=1:length(coef)
    sum = sum + coef(k).*x.^(length(coef)-k);
  endfor
  y=sum;
  
endfunction

coefic=[7.7636e-03,-5.3610e-02,-5.1304e-01,1.6396e+00,2.1881e+00,-5.0273e+00]

figure(1)
plot(x1_1,creaPol(polyinterpolador(interpolNewton(x1,y1),x1), x1_1))
hold off
x2=[0,1,2,3]
y2={[1,2],[0,1,1],[3],[1,1]}

x2_1=linspace(-7,12,150);

[coefN, nodos]=interpolHermite(x2,y2);

figure(2)
#plot(x1_1,polyinterpolador_eval(interpolNewton(x1,y1),x1,x1_1))
plot(x2_1,polyinterpolador_eval(coefN,nodos,x2_1))
hold off
#b)






