clc 
clear all
format long 
addpath('../biblioteca')



x=[1,1.02,1.04,1.06]
a=[0.76578939,0.79536678,0.82268817, 0.84752226]


[b,c,d]=splineSujeto(x,a,1.17549773,1.53157877)
function a=f(x)
  a=3.*x.*e.^x.-e.^(2.*x);
  
endfunction

t=linspace(1,1.06,200);
figure(1)
plot(t,splineEval(x,a,b,c,d,t));
hold on 
plot(t, f(t));
legend("Spline","funcion")

splineEval(x,a,b,c,d,1.03)
f(1.03)

figure(2)
e_abs_f=@(m) abs(splineEval(x,a,b,c,d,m)-f(m))
e_abs=abs(splineEval(x,a,b,c,d,1.03)-f(1.03))
plot(t,e_abs_f(t))
hold off
f(1.03)


x1=[2,3,4,5,6];
y1=[0.69315,1.0986,1.3863,1.6094,1.7918];

coef=interpolNewton(x1,y1)
polyinterpolador_eval(coef,x1,3.2)























