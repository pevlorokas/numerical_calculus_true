close all
clear all
clc

addpath("../Biblioteca")  

disp("Ejercicio 1 \n")
disp("Funciones a utilizar:\n")
disp("  Apartado 1, interpol_trozos(nudos,nodos,ordenadas de los nodos): devuelve una")
disp("matriz con los polinomios interpoladores en cada subintervalo de nudos, en ")
disp("la forma normal, la forma de Newton solo la imprime.\n")
disp("  Apartado 2, DOS FUNCIONES:1) polyinterpolador_trozos_eval_total: evalúa solo ")
disp("un polinomio y lo dibuja todos en el intervalo; 2) polyinterpolador_a_trozos_eval ")
disp("evalúa cada polinomio en el subintervalo de nodos correspondiente, y devuelve el total.\n\n")
disp("Funciones auxiliares:\n")
disp("  nudos_nodos: devuelve un vector de nudos según el numero de divisiones escogido,")
disp("una matriz de nodos en esos subintervalos, y un conjunto de abscidas para graficar.\n")
disp("  nudos_nodos_con_gravedad: igual que el anterior pero hacemos un efecto de atracción")
disp("hacia el 0\n\n\n")

disp("Comenzamos con los ejemplos del apartado 3: \n")

m=input('Introduce un numero de nudos: ');
d=input('Introduce un numero de nodos por intervalo de nudos: ');
inicio=0;
fin=pi;


#Una funcion auxiliar para que me genere los nodos y nudos


function [nudos,nodos,t]=nudos_nodos(m,d,in, fi)
  nudos=linspace(in,fi,m);
  nodos=zeros(m-1,d+1);
  
  for i=1:m-1;
    nodos(i,:)=linspace(nudos(i),nudos(i+1),d+1);
    ##  Le asignamos los nodos de manera sencilla
  endfor
  t=linspace(in,fi,200); # para cuando necesitemos graficar algo dejamos esto
  
endfunction



#a)
[nudos,nodos,t]=nudos_nodos(m,d,inicio,fin)



##
##for i=1:m-1;
##  nodos(i,:)=linspace(nudos(i),nudos(i+1),d+1) 
####  Le asignamos los nodos de manera sencilla
##endfor
##

lamatris=interpol_trozos(nudos, nodos, sin(nodos))
disp("La funcion que usaremos para graficar los polinomios interpoladores a trozos es  polyinterpolador_a_trozos_eval \n y para una vision de todos los polinomios juntos polyinterpolador_trozos_eval_total");


plot(t, sin(t),'color','g');
axis([inicio,fin,-2,2])
title("Todos los polinomios juntos")
legend('sin(x)')
hold on
for i=1:length(nudos)-1  
  plot(t,polyinterpolador_trozos_eval_total(t ,lamatris, nudos,i));
  hold on
endfor
hold off


#Si ahora dibujamos solo los intervalos correspondientes a cada polinomio interpolador tenemos que
figure(2)
plot(t,polyinterpolador_a_trozos_eval(t ,interpol_trozos(nudos, nodos, sin(nodos)), nudos))
title("Polinomios a trozos")
hold on
plot(t, sin(t))
legend('Interpol', 'sin(x)')
hold off


figure(3) #Error
plot(t,abs(polyinterpolador_a_trozos_eval(t ,interpol_trozos(nudos, nodos, sin(nodos)), nudos)-sin(t)));
title("Error de aproximacion de los Polinomios")


vectornodos=linspace(inicio,fin,m*d-1)

figure(4)
plot(t, polyinterpolador_eval(interpolNewton(vectornodos,sin(vectornodos)),vectornodos,t));
title('Polinomio interpolador normal')
hold on 
plot(t, sin(t));
hold on 
plot(t, polyinterpolador_a_trozos_eval(t ,interpol_trozos(nudos, nodos, sin(nodos)), nudos));
legend('polinomio normal', 'sin(x)','pol a trozos')
hold off

figure(5)
plot(t, abs(polyinterpolador_eval(interpolNewton(vectornodos,sin(vectornodos)),vectornodos,t)-polyinterpolador_a_trozos_eval(t ,lamatris, nudos)));
title('Error en los polinomios a trozos c.r.a polinomio interpolador normal')





#b)
printf("Ahora pulsa para apartado b");
pause
disp("\n");
close all



m=input('Introduce un numero de nudos: ');
d=input('Introduce un numero de nodos por intervalo de nudos: ');
f=@(x) 1./(1+x.^2);
inicio=-5 
fin=5
[nudos,nodos,t]=nudos_nodos(m,d,inicio,fin);
figure(1)
plot(t, f(t),'color','g');
xlim([inicio,fin])
title("Todos los polinomios juntos")
legend('sin(x)')
hold on

for i=1:length(nudos)-1  
  plot(t,polyinterpolador_trozos_eval_total(t ,interpol_trozos(nudos, nodos, f(nodos)), nudos,i));
  hold on
endfor
hold off


lamatris=interpol_trozos(nudos, nodos, f(nodos));
#Si ahora dibujamos solo los intervalos correspondientes a cada polinomio interpolador tenemos que
figure(2)
plot(t,polyinterpolador_a_trozos_eval(t ,lamatris, nudos));
axis([inicio,fin,-2,2])
title("Polinomios a trozos")
hold on
plot(t, f(t));

legend('Polinomio interpol a trozos', '1/(x^2+1)')
hold off


figure(3) #Error
plot(t,abs(polyinterpolador_a_trozos_eval(t ,lamatris, nudos)-f(t)));
axis([inicio,fin,-1.5,1.5])
title("Error de aproximacion de los Polinomios")

vectornodos=linspace(inicio,fin,m*d-1)

figure(4)
plot(t, polyinterpolador_eval(interpolNewton(vectornodos,f(vectornodos)),vectornodos,t))
hold on 
plot(t, f(t))
hold on 
plot(t, polyinterpolador_a_trozos_eval(t ,interpol_trozos(nudos, nodos, f(nodos)), nudos));
legend('Polinomio interpol normal', '1/(x^2+1)', 'Polinomio interpol a trozos')
axis([inicio,fin,-2,2])
title('Polinomio interpolador normal')
hold off

figure(5)
plot(t, abs(polyinterpolador_eval(interpolNewton(vectornodos,f(vectornodos)),vectornodos,t)-polyinterpolador_a_trozos_eval(t ,lamatris, nudos)));
axis([inicio,fin,-2,2])
title('Error en los polinomios a trozos c.r.a polinomio interpolador')


#c)

printf("Ahora pulsa para apartado c")
pause
disp("\n")
close all

m=input('Introduce un numero de nudos: ');
d=input('Introduce un numero de nodos por intervalo de nudos: ');
inicio=0;
fin=1;

#Un pequeña funcion para apelotonar un poco mas los puntos cerca del 0
function [nudos,nodos,t]=nudos_nodos_con_gravedad(m,d,inicio, fin)
  
  nudos_paso1=linspace(inicio,fin,m);
  nudos=nudos_paso1.^2;
  
  nodos=zeros(m-1,d+1);
  
  for i=1:m-1;
    nodos(i,:)=(linspace(nudos(i),nudos(i+1),d+1)).^2;
    ##  Le asignamos los nodos de manera sencilla
  endfor
  
  t=linspace(inicio,fin,200);
  # El programa se puede expandir para que el punto de gravedad no sea el 0, pero 
  # eso ya lo dejamos para cuando no estemos muriendonos de agobio
endfunction

[nudos,nodos,t]=nudos_nodos_con_gravedad(m,d,inicio,fin)


vectornodos=[];
elem_repe="algoXD";

#Un algoritmo sencillo para poner los nodos en un vector sin repetirlos
# Antes no era necesario por que estaban equiespaciados, pero estos no
for i=1:m-1
  for j=1:d+1
    if elem_repe~=nodos(i,j);
      elem_repe=nodos(i,j);
      vectornodos=[vectornodos nodos(i,j)];
    else
      continue
    endif
    
  endfor
endfor


#hay que cogerlos mas proximos al 0 que al 1, como hago yo esto?
#Pues si hacemos x^2 para los nudos que nos salgan, entonces se pegarán mas al 0

f=@(x) x.^(5/2);


figure(1)
plot(t, f(t),'color','g');
axis([inicio,fin,-2,2])
hold on

xlim([inicio,fin])
title("Todos los polinomios juntos")
legend('f(x)')
hold on

for i=1:length(nudos)-1  
  plot(t,polyinterpolador_trozos_eval_total(t ,interpol_trozos(nudos, nodos, f(nodos)), nudos,i));
  hold on
  plot(nodos(i,:),f(nodos(i,:)),'*',[0],[0],'o')
  hold on
endfor
hold off


lamatris=interpol_trozos(nudos, nodos, f(nodos));
#Si ahora dibujamos solo los intervalos correspondientes a cada polinomio interpolador tenemos que
figure(2)
plot(t,polyinterpolador_a_trozos_eval(t ,lamatris, nudos));
axis([inicio,fin,-1,1])
title("Polinomios a trozos")
hold on
plot(t, f(t));

legend('Polinomio interpol a trozos', 'x^(5/2)')
hold off


figure(3) #Error
plot(t,abs(polyinterpolador_a_trozos_eval(t ,lamatris, nudos)-f(t)));
title("Error de aproximacion de los Polinomios")



figure(4)
plot(t, polyinterpolador_eval(interpolNewton(vectornodos,f(vectornodos)),vectornodos,t))
axis([inicio,fin,-2,2])
hold on 
plot(t, f(t))
hold on 
plot(t, polyinterpolador_a_trozos_eval(t ,interpol_trozos(nudos, nodos, f(nodos)), nudos));
legend('Polinmio interpol normal', '1/(x^2+1)','Polinomio interpol a trozos')
title('Polinomio interpolador normal')
hold off

figure(5)
plot(t, abs(polyinterpolador_eval(interpolNewton(vectornodos,f(vectornodos)),vectornodos,t)-polyinterpolador_a_trozos_eval(t ,lamatris, nudos)));
title('Error en los polinomios a trozos c.r.a polinomio interpolador')






##Tenemos que dibujar ahora su derivada para el ejemplo de Runge, vamos
##a hacer un algoritmo para ello

function matrizcoef=derivarpolinomio(matriz)
  m=length(matriz(:,1))+1;
  grado_pols=length(matriz(1,:));
  multip=0;
  matrizcoef=zeros(length(matriz(1,:)-1),length(matriz(:,1))); #tendrá menos columnas ya que el termino independiente se va
  
  for i=1:m-1
    for j=2:grado_pols
      matrizcoef(i,j-1)=matriz(i,j)*(j-1); #tomamos los coeficientes del segundo para alante y les multiplicamos su grado
    endfor
  endfor
endfunction


disp("Ahora, vamos a ver la derivada de mi polinomio interpolador a trozos \n ya que en mi caso es continua \n")
disp("Pulsa para ver las graficas ")
pause
close all

m=input('Introduce un numero de nudos: ');
d=input('Introduce un numero de nodos por intervalo de nudos: ');
f=@(x) 1./(1+x.^2)
inicio=-5;
fin=5;
[nudos,nodos,t]=nudos_nodos(m,d,inicio,fin);

lamatris=interpol_trozos(nudos, nodos, f(nodos));

figure(1)
plot(t,polyinterpolador_a_trozos_eval(t ,lamatris, nudos));
title("Polinomios a trozos sin derivar")
hold on
plot(t, f(t));
legend('Polinomio interpol a trozos', '1/(x^2+1)')

hold off

figure(2)
pols_deriv=derivarpolinomio(lamatris);
plot(t,polyinterpolador_a_trozos_eval(t,pols_deriv, nudos));
title("Derivada")

hold off

disp("A mi no me ha parecido discontinua, puede ser que sea el cambio brusco cerca de 2.6/2.5 \n \n FIN DEL EJERCICIO")
##FIN DEL PRIMER EJERCICIO

