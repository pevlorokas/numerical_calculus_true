clc
close all
clear all
addpath('../biblioteca')
addpath('../biblioteca_entrega2')
format long g

disp("Ejercicio 2 de la entrega 2\n\n")

disp("Primer metodo, gaussLegendre. \nPrimero vamos a ajustar las funciones que tenemos.\n")

##f2=@(x) e^(-x^2)
f1=@(y) e^(-y^2)
f_raiz=@(x) (1-x^2)^(1/2)

disp("Vamos a ponerle 10 puntos y 4 subintervalos...\n")
integral_primera=@(x) gaussLegendre(f1,-f_raiz(x),f_raiz(x),10,4)

f2_gauss=@(x) e^(-x^2).*(integral_primera(x))

integral_segunda= gaussLegendre(f2_gauss,-1,1,10,4)
disp("\nEste resultado se parece mucho al exacto: 1.985865303798871. \n\n")

disp("Vamos a probar ahora con puntos y subintervalos que tu escojas...\nPulsa enter para continuar")
p=input("Elige el numero de puntos por subintervalo: ")
pg=input("Elige un numero de puntos de gauss entre 1,2,3,4,5 o 10: ")


integral_primera=@(x) gaussLegendre(f1,-f_raiz(x),f_raiz(x),p,pg)

f2_gauss=@(x) e^(-x^2).*(integral_primera(x))
disp("Esto tardará un poco dependiendo de los puntos...\n")
disp("Nuestro valor final: ")
integral_segunda= gaussLegendre(f2_gauss,-1,1,p,pg)

disp("\nAhora vamos con el metodo del trapecio, por ejemplo.\nPulsa enter para continuar \n")
pause
display("Solo tengo que cambiar las funciones del apartado anterior un poco.\n")

disp("Vamos a ponerle 10 puntos...\n")
trapecio_1=@(x) trapecio(f1,-f_raiz(x),f_raiz(x),10)
f2_trapecio=@(x) e^(-x^2).*(trapecio_1(x))
disp("Nuestro valor final: ")
trapecio2 = trapecio(f2_trapecio,-1,1,10)

disp("Vamos a ponerle los puntos que elijas tú, a ver como de fina es la aproximaxión.\nPulsa enter para seguir")

ptos=input("Elige el numero de puntos para hacer la aproximación del trapecio: ")

trapecio_1=@(x) trapecio(f1,-f_raiz(x),f_raiz(x),ptos)
f2_trapecio=@(x) e^(-x^2).*(trapecio_1(x))

disp("Nuestro valor final: ")
trapecio2 = trapecio(f2_trapecio,-1,1,ptos)

disp("\nFIN DEL EJERCICIO 2 Y DE LA TAREA 2 DE ENTREGA")




