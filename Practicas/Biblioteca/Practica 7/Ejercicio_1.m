close all
clear all
clc

addpath('../biblioteca')

t=linspace(1,4,200);

f=@(x) e.^(-x./60);
g=@(x) cos(pi.*x);
h=@(x) f(x)-g(x)
dh=@(x) -(e.^(-x./60))/60 + pi.*sin(x.*pi);

figure(1)

plot(t,f(t))
hold on
plot(t,g(t))
legend('f','g')
hold off

disp("Ahora vamos a ver con el metodo de newton")

[x,fx,npasos]=newton(h,dh,0,1*(10^-30),1000,1)

figure(2)
plot(t, h(t))
legend("f(x)-g(x)")

disp("Se cancela la diferencia en los ceros del coseno")

#c)
vector_anula=[];
for k=0:100
  m=k+1/2;
  [x,fx,npasos]=newton(h,dh,m,1*(10^-20),100,0);
  if f(x)>0 && g(x)>0
    vector_anula=[vector_anula x]
  endif
endfor


disp(" \n \n estos son los 100 primeros puntos positivos donde se anula")
vector_anula
t1=linspace(0, 100,300);
figure(3)
plot(t1,f(t1))
hold on
plot(t1,g(t1))
hold on
plot(vector_anula,f(vector_anula),'*',[0],[0],'o')



