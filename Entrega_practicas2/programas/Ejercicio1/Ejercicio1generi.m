#Ejercicio 1
clear all
close all
clc

display("Las funciones que se van a usar durante este primer ejercicio son\n")
display("\tpolyLaguerre_solo(n) que toma el grado n del polinomio a evaluar\n")
display("\tpolyLaguerre(n): devuelve una matriz (n+1)x(n+1) con los coeficientes\n")
display("\tde los polinomios a los que aproximan.")
display("\tcerosLaguerre(pol, M): por parametros toma los polinomios de los\n")
display("\tque vamos a sacar raices, y M es la cota por la que empezamos a\n")
display("\tbuscar las raices de los polinomios de laguerre.\n")


addpath('../biblioteca')
addpath('../biblioteca_entrega2')
format long g
##Una función propia para que te haga el polinomio de Laguerre
##del grado que le indiques, no requiere de la matriz para ello.
disp("Solo el recordatorio de que las funciones estan planteadas de forma\n")
disp("generica para todo polinomio.\nPulsa enter para sacar a la luz todo el script")
pause
disp("\nEl valor del polinomio de Laguerre de grado 7 que nos pide.\n")
pol7 = polyLaguerre_solo(7)

##d_pol7 = polyder(pol7) # Su derivada (que no se quiere para nada)
disp("La busqueda de las raices del polinomio\n")
raicespol7Laguerre = cerosLaguerre(pol7,100) #funcion del apartado 2
disp("Los valores de las raices aproximadas (iguales a las dadas al final de la hoja): \n")
vals=polyval(pol7, raicespol7Laguerre)

disp("Como se puede ver, tiene unos resultados bastante próximos a las raices\n con un error de 10^-11\n")
disp("Ahora el apartado 3, pulsa para ver los coeficientes de Lagrange de\n")
disp("las raices que hemos calculado\n")

disp("Los factores de lagrange por cada raiz del polinomio sacada.\n")
facts=factores_lagrange(raicespol7Laguerre)

display("Apartado 4, con la formula recurrente a continuacion: \n")

function f = intExp(n,x)
  
  f=e^(-x)*x.^n;
  
  if n==0
    f=-e^-x; #Ya que integral(e^-x es -e^-x que definida en o- infinito nos da 1)
  
  else
   f = -f+n*intExp(n-1,x);  #(-f(+inf)+n*(intExp(n-1)))-(-f(0)+n*(intExp(n-1)));
  endif

  
endfunction
#Esta funcion es recurrente, se hace rapido en papel al hacer integracion por partes
g=@(x,n) intExp(n,x)  #Una funcion para facilitar la escritura

casi_infinito=10000000000; #Es un valor que obviamente no es infinito, pero
#octave da muchos problemas con las indeterminaciones de los límites para
#integrales impropias así que con este numero nos da el resultado exacto
#y no hay problemas de cálculo.

c=[]; #los pesos...

disp("Evaluacion de pesos procesando...\n")
for i=1:length(facts(:,1))
  sum=0;
  for j=1:length(facts(1,:))
    sum= sum+(facts(i,j)*(g(casi_infinito,(length(facts(i,:))-j))-g(0,(length(facts(i,:))-j))));
  endfor

  c=[c sum];
endfor
disp("Pesos del metodo de cuadratura (coinciden con los que nos dás): \n")
c
disp("\nIntegral de los 7 puntos: \n")


disp("Una pruebecilla...")
suma=0;
for i=1:length(raicespol7Laguerre)
  suma= suma+polyval(pol7,raicespol7Laguerre(i))*c(i);
  
endfor
suma


disp("\nEstos son los resultados de las integrales de las funciones que nos dan:\n")
#primera funcion (1) 
suma1=0;
for i=1:length(raicespol7Laguerre)
  suma1=suma1+c(i)*(raicespol7Laguerre(i));
endfor
suma1

suma2=0;
for i=1:length(raicespol7Laguerre)
  suma2=suma2+c(i)*raicespol7Laguerre(i)*(raicespol7Laguerre(i));
endfor
suma2

disp("\nAhora el apartado 7\nPrimera función:\n")
funcion1=@(x) x.*cos(x);
suma6_1=0;
for i=1:length(raicespol7Laguerre)
  suma6_1=suma6_1+c(i)*(funcion1(raicespol7Laguerre(i)));
  
endfor
suma6_1

disp("\nSegunda función:")
funcion2=@(x) e^(-x^(2)+2*x);
suma6_2=0;
for i=1:length(raicespol7Laguerre)
  suma6_2=suma6_2+funcion2(raicespol7Laguerre(i))*c(i);
endfor
suma6_2

disp("\n\n\nY ya está, por fín he acabado este ejercicio infernal\n")







