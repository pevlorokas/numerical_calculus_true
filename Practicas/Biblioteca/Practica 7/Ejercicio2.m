clear all
close all
clc

addpath('./biblioteca')

aprox_integral=@(x,f) trapecio(f,-10000, x,10000000);
f=@(x) e.^(-x.^2./2)
phi=@(x) (1./(sqrt(2*pi)))*aprox_integral(x,f);
h=@(x) phi(x)-0.9757;
dh=@(x) aproxDeriv3(h,x,0.0001,'i');
[x,hx,npasos]=newton(h,dh , 0.5,1*(10.^-20),100,0);