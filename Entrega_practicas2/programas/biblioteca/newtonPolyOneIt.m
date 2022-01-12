%% Autor: Salvador Sánchez-Pedreño
%% Produce una única iteración del método de Newton para un polinomio (real o complejo)
%%  a partir de un punto inciial x0
%% Entradas:
%%    - p, el polinomio
%%    - x0, punto inicial para el método
%% Salidas:
%%     - x1, la iteración a partir de x0.
%% El objetivo es poder "seguir la pista" a las iteraciones de un punto: 
%%  véase el ejercicio 3 de la práctica 8 del curso CN1V 2021-22

%% Calcula p(x) y p'(x) con el algoritmo de Horner


function x1=newtonPolyOneIt(p,x0)
  npasos=1;
  x=x0;
  n=length(p);         
  pz=p(1);
  dpz=pz;
  for k=1:1:n-2
    pz=pz*x+p(k+1);
    dpz=dpz*x+pz; ##valor de la derivada de p en x
  endfor 
  pz=pz*x+p(n); ##valor de p en x
  if( abs(dpz)<2*eps )
    disp('Newton: derivada nula')
    x1=x;
    return
  endif
  deltax=pz/dpz;
  x1=x-deltax;                 
  return;     
endfunction






