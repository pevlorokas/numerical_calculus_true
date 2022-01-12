clear all
close all
clc



addpath('../biblioteca')
##f=@(x) (1+0.01 .*randn(1,1))*sin(x)
##t=linspace(0,2*pi,100);
##
##for k=1:1:length(t)
##  y(k)=f(t(k));
##  
##endfor
##
##
##
##figure(1)
##plot(t,f(t))
##hold on 
##plot(t,sin(t))
##
##
##pert=aproxDeriv3(f,t,0.01,'i')
##no_pert=aproxDeriv3(sin,t,0.01,'i')
##figure(2)
##plot(t, aproxDeriv3(f,t,f(t),'i'))

addpath ('../biblioteca')
close all
clear all
m=0.01;
L=1000;
x=linspace(0,2*pi,L);
f=@(x)(1+m.*randn(1,1)).*sin(x)
f_1=@(x)sin(x)
g=@(x)(1+m.*randn(1,L)).*sin(x)
y=g(x)
y1=f_1(x)
y_1=[];
for i=1:1:L
  y_1(i)= aproxDeriv3(f,x(i),m,i);
endfor
y_2=aproxDeriv3Vect(x,y)
y_3=aproxDeriv3(f_1,x,m,1)
y_4=aproxDeriv3Vect(x,y1)
MAX = max(y_4-y_1)
MAX1= max(y_3-y_2)
figure(1)
plot(x,y_2,'g')
hold on
plot(x,y_4,'b')
figure(2)
plot(x,y_1, 'y')
hold on 
plot(x,y_3, 'r')
