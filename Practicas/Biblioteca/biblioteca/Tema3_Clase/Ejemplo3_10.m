%% Autor: Salvador Sánchez-Pedreño, CN1V, curso 2021-22
%% Ejemplo 3.10 de las notas del curso
%% Comparación de los métodos del trapecio y de Simpson en un caso particular 
%%  y estimación del orden del error

clear all
addpath('../Biblioteca')


output_precision(16,"local");
f=@(x) exp(x);
a=0;
b=1;

fmt='%4u\t\t %16.16f\t\t%16.16e\t\t %5.4f\n';
disp('Regla del trapecio')
errorold=0;
for n=1:11
int=trapecio(f,a,b,2^n);
error=int-(e-1);
printf(fmt,2^n,int,error,errorold/error)
errorold=error;
endfor

disp('')
disp('Regla de Simpson')
errorold=0;
for n=0:11
int=simpson(f,a,b,2^n);
error=int-(e-1);
printf(fmt,2^n,int,error,errorold/error)
errorold=error;
endfor


rmpath('../Biblioteca')