%% Autor: Salvador Sánchez-Pedreño, CN1V, curso 2021-22
%% Ejercicio 3.10
%% Estimación del error en la regla del trapecio mediante la diferencia de las derivadas
%% de la función en los extremos del intervalo (regla del trapecio corregida). Caso de exp(-x^2).
%% Incluye aproximación de la integral con herramientas de Octave.
clc
clear all
addpath('../Biblioteca')
output_precision(16,"local");
f=@(x) exp(-x.^2);
N=230;
printf('Aproximación de la integral con %u intervalos: regla del trapecio:\n',N)
app=trapecio(f,0,1,N)
disp('Valores calculados por Octave con distintos métodos:')
val1=integral(f,0,1)
val2=quad(f,0,1)
estim=2/(12*e)*(1/N)^2;
printf('Estimació del error en la regla:%16.16e\n',estim)
printf('Error absoluto: %16.16e\n',abs(app-val1))



##pause
##disp('Aproximación de la integral con 5 intervalos: regla de Simpson:')
##
##app=simpson(f,0,1,6)
##
##printf('Error absoluto: %d\n',abs(app-val1))


rmpath('../Biblioteca')