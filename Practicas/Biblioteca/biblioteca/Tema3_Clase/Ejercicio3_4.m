%% Autor: Salvador Sánchez-Pedreño, CN1V, curso 2021-22
%% Ejercicio 3.4
%% Aproximación de la derivada mediante la fórmula de evaluación en tres pountos
%% en casos concretos. Incluye cálculo del error teórico estimado y del error real.
clc
clear all

clc
clear all
addpath('../Biblioteca')

output_precision(7,"local");
disp('Tabla a): f(x)=exp(2x)')
x=[1.1,1.2,1.3,1.4];
y=[9.025013,11.02318,13.46374,16.44465];
disp('Aproximaciones con tres puntos:')
app=aproxDeriv3Vect(x,y)

f=@(x)  exp(2*x);
df=@(x) 2*exp(2*x);

m3=8*f(1.4);
disp('Valores exactos:')
real=df(x)

disp('Errores:')
abs(real-app)
disp('Estimaciones del error:')
disp('')
printf('En centrales: %d\n',0.1^2*m3/6)
printf('En extremos: %d\n',0.1^2*m3/3)

pause
disp('Tabla b): f(x)=xcos(x)-x^2sen(x)')
x=[2.9,3.0,3.1,3.2];
y=[-4.827866,-4.240058,-3.496909,-2.596792];
disp('Aproximaciones con tres puntos:')
app=aproxDeriv3Vect(x,y)

f=@(x) x.*cos(x)-x.^2.*sin(x);
df=@(x) (1-x.^2).*cos(x)-3*x.*sin(x);

%% utilizando Maxima (plot2d) acotamos f'''(x) en [2.9,3.2] por m3=6
m3=6;
disp('Valores exactos:')
real=df(x)

disp('Errores:')
abs(real-app)
disp('Estimaciones del error:')
disp('')
printf('En centrales: %d\n',0.1^2*m3/6)
printf('En extremos: %d\n',0.1^2*m3/3)

rmpath('../Biblioteca')