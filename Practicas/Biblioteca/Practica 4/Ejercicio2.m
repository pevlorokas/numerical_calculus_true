close all
clear all
clc

addpath('../biblioteca')
#a)
theta=linspace(0,4*pi,21);
mod=2*theta;

x=@(z) 2.*z.*cos(z)
y=@(z) 2.*z.*sin(z)


#b)

[b,c,d]=splineNatural(theta,x(theta))
[b1,c1,d1]=splineNatural(theta,y(theta))

#c)
t=linspace(0,4.*pi,200);
figure(1)
#plot(t,splineEval(theta,x,bx,cx,dx,t))
plot(x(t),y(t))
hold off

figure(2)

plot(splineEval(theta,x(theta),b,c,d,t),splineEval(theta,y(theta),b1,c1,d1,t))
#legend('x_theta','y_theta')
hold off




