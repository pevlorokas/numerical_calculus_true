close all
clear all
clc

addpath('../biblioteca')

#a)
##function vec=ordenado(x)
##  vec=
##  for k=1:length(x)
##    if (x,
##  endfor
##
##
##
##endfunction

x=[0,1,2,3]
y=[1,4,2,0]

[b,c,d]=splineNatural(x,y)

t=linspace(0,3,200);

figure(1)
plot(t,splineEval(x,y,b,c,d,t))

#b)
d_in=[0,1,-2,-5]
d_fin=[-1, 5,-5,-1]


figure(2)
for k=1:length(d_in)
  [b1,c1,d1]=splineSujeto(x,y,d_in(k),d_fin(k))
  plot(t,splineEval(x,y,b1,c1,d1,t))
  
  #legend('Derivada inicial: ',mat2str(d_in(k)),'. Derivada final: ',mat2str(d_fin(k)))
  hold on

endfor
hold off

#c)
x2=[0,1,2,5]
y2=[0,2,4,10]
[b2,c2,d2]=splineNatural(x2,y2)
splineTabla(x,y,b2,c2,d2)

#d)
x3=[0,1,2,3]
y3=[0,1,8,27]
d_in3=0
d_fin3=27
[b3,c3,d3]=splineSujeto(x3,y3,d_in3,d_fin3)
splineTabla(x3,y3,b3,c3,d3)




