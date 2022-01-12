clear all
close all
clc

addpath('../biblioteca')

f=@(x) (1+0.01.*randn(1,1)*sin(x)

t=linspace(0,2*pi,200)

figure(1)
plot(t,f(t))


rt=aproxDeriv3(f,t,0.01,'i')
figure(2)
plot(t, aproxDeriv3(f,t,f(t),'i'))





