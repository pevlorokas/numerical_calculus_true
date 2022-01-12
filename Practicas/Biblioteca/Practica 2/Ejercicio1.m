clc
clear all
close all

% a)

f= @(x) pi + sqrt(1+x.^2)
printf("Imprimiendo función...")
x = linspace(-3,3,179);
figure(1)

plot(x,f(x))

plot(x,f(x),'color','c','linewidth',2)
legend("funcion a)")
hold on
% b)
plot(x,sin(x),'linestyle','--','color','b')
legend("sin(x)")
hold on
% c)
plot(x,sin(x)+f(x),'linestyle','-.','color','g')
legend("h=sin(x)+f(x)")
% d)
title("Mi primer grafico") %Te pone arriba el titulo que he puesto


hold off



