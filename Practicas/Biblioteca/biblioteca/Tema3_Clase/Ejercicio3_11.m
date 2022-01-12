%% Autor: Salvador Sánchez-Pedreño, CN1V, curso 2021-22
%% Ejercicio 3.10
%% Estimación del error en la regla del trapecio mediante y de Simpson. Caso de exp(-x^2).
%% Incluye aproximación de la integral con herramientas de Octave.

clc
clear all
addpath('../Biblioteca')

output_precision(16,'local');
f=@(x) exp(-x.^2);

disp('Aproximación de la integral con 41 intervalos: regla del trapecio:')
app=trapecio(f,0,1,41)

disp('Valores calculados por Octave con distintos métodos:')
val1=integral(f,0,1)
val2=quad(f,0,1)

printf('Error absoluto: %d\n',abs(app-val1))



pause
disp('Aproximación de la integral con 4 intervalos: regla de Simpson:')

app=simpson(f,0,1,4)

printf('Error absoluto: %d\n',abs(app-val1))


rmpath('../Biblioteca')