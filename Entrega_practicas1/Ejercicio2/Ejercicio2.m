close all
clear all
clc

addpath('../Biblioteca')
disp("Ejercicio 2:\n")
disp("Funciones:\n")
disp("Apartado 1, polyinterpol_Hermite_a_trozos: Evalua los nodos, y las imagenes de") 
disp("estos en su derivada primera, para construir en un conjunto de nodos(=nudos)")
disp("el polinomio interpolador en dicho intervalo.\n")
disp("Apartado 2: Usaremos la función polyinterpolador_a_trozos_eval ya que funciona")
disp("de la misma forma.\n")


f=@(x) 1./(1+x.^2)
df=@(x) (-2.*x)./((1+x.^2).^2)
disp("Vamos a comenzar el tercer apartado del ejercicio 2 \n")
m=input("Introduce el número de nudos/nodos que quieres meter: ")
inicio=-5;
fin=5;
nodos=linspace(inicio,fin,m)
df(nodos)
t=linspace(inicio,fin,200);

MatrizCoefPol=polyinterpol_Hermite_a_trozos(nodos,f(nodos),df(nodos));
disp("La funcion que usaremos para graficar los polinomios interpoladores a trozos es  polyinterpol_Hermite_a_trozos. \n");





#Si ahora dibujamos solo los intervalos correspondientes a cada polinomio interpolador tenemos que
figure(1)
plot(t,polyinterpolador_a_trozos_eval(t ,MatrizCoefPol, nodos))
title("Polinomios de Hermite a trozos")
hold on
plot(t, f(t))
legend('Interpol', 'f(x)')
hold off


figure(2) #Error
plot(t,abs(polyinterpolador_a_trozos_eval(t ,MatrizCoefPol, nodos)-f(t)));
title("Error de aproximacion de los Polinomios de Hermite a trozos")


figure(3)
plot(t, polyinterpolador_eval(interpolNewton(nodos,f(nodos)),nodos,t));
title('Polinomio interpolador normal')
hold on 
plot(t, f(t));
hold on 
plot(t, polyinterpolador_a_trozos_eval(t ,MatrizCoefPol, nodos));
legend('polinomio normal', 'f(x)','Pol a trozos de H')
hold off

figure(4)
plot(t, abs(polyinterpolador_eval(interpolNewton(nodos,f(nodos)),nodos,t)-polyinterpolador_a_trozos_eval(t , MatrizCoefPol, nodos)));
title('Error en los polinomios de H a trozos c.r.a polinomio interpolador normal')


#4)

disp("Comenzamos el cuarto apartado, con los splines, usando los mismos nodos que antes (sino te gustan, pues reinicia y cambialos) \n Pulse enter para iniciar")
pause
close all

[b,c,d]=splineSujeto(nodos,f(nodos),df(inicio),df(fin));

figure(1)
plot(t, splineEval(nodos,f(nodos),b,c,d,t));
title("Splines")
hold on

plot(t, f(t))
hold on

plot(t,polyinterpolador_a_trozos_eval(t,MatrizCoefPol,nodos));
legend('Splines','f(x)','Polinmions H a trozos');
hold off

#Error
figure(2)
plot(t, abs(splineEval(nodos,f(nodos),b,c,d,t)-polyinterpolador_a_trozos_eval(t,MatrizCoefPol,nodos)));
title("Error de los Polinmios H a trozos c.r.a Splines")
hold off









disp("El ultimo aparado de este ejercicio. \nPulsa enter para continuar...")
pause
close all
disp("Derivada de la funcion runge: \n \n")


##df2=@(x) (-2-6.*x.^2)./((1+x.^2).^3)


#Implementando el algoritmo que creamos para derivar polinomios en el ejercicio 1:ç
function matrizcoef=derivarpolinomio(matriz)
  m=length(matriz(:,1))+1;
  grado_pols=length(matriz(1,:));
  multip=0;
  matrizcoef=zeros(length(matriz(1,:)-1),length(matriz(:,1))); 
  
  for i=1:m-1
    for j=2:grado_pols
      matrizcoef(i,j-1)=matriz(i,j)*(j-1); 
    endfor
  endfor
endfunction

derivpol1=derivarpolinomio(MatrizCoefPol);
derivpol2=derivarpolinomio(derivpol1);

figure(1)
plot(t, polyinterpolador_a_trozos_eval(t,derivpol1,nodos));
hold off

disp("Pues la verdad, no veo que sea discontinua... \n\nEn cualquier caso, FIN DEL EJERCICIO 2")







