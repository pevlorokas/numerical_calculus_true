%% Autor: Salvador Sánchez-Pedreño, CN1V, curso 2021-22
%% Ejercicio 3.5
%% Aproximación de la derivada segunda mediante la fórmula de evaluación en tres pountos
%% en un caso concreto con dos pasos distintos. Incluye cálculo del error teórico estimado y del error real.

clc
clear all
addpath('../Biblioteca')

output_precision(7,"local");
f=@(x)  3*x.*exp(x)-cos(x);
ddf=@(x) cos(x)+3*(x+2).*exp(x);

disp('Aproximaciones con tres puntos:')
disp('Caso 1: paso h=0.1')

h=0.1;
app=aproxSegundaDeriv3(f,1.3,h)

%% utilizando Maxima (plot2d) acotamos f''''(x) en [1.2,1.4] por m4=66
m4=66;
disp('Valor exacto:')
real=ddf(1.3)

disp('Error:')
abs(real-app)
printf('Estimación del error: %d\n',h^2*m4/12)


pause
disp('Caso 2: paso h=0.01')
h=0.01;
app=aproxSegundaDeriv3(f,1.3,h)

disp('Error:')
abs(real-app)
printf('Estimación del error: %d\n',h^2*m4/12)

rmpath('../Biblioteca')