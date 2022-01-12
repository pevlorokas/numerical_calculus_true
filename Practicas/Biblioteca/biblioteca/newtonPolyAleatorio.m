%% Autor: Antonio Pallarés
%% Modificaciones de: Salvador Sánchez-Pedreño
%% Método de Newton para aproximar los ceros de un polinomio mediante el método de  Newton, 
%%  eligiendo puntos al azar dentro del disco (de Cauchy) que contiene a todos los ceros.
%% Utiliza el método de Horner para evaluar simultáneamente el valor de p(x) y de p'(x)
%% Entradas:
%%    - p, el polinomio
%%    - tol, tolerancia, estimación del error para detener la iteración
%%    - maxit, número máximo de iteraciones del método de Newton (para cada punto inicial)
%%    - intentos, es el número máximo de puntos aleatorios que se podrán elegir antes de encontrar una aproximación a todas las raíces
%%    - imprime, si toma el valor 1 se imprime una tabla de los valores itermedios
%% Salidas:
%%     - raices, el vector de aproximaciones a las raíces encontrado
%% Si se supera el número máximo de intentos devuelve las raíces encontradas que serán menos de las necesarias


function raices= newtonPolyAleatorio(p,tol,maxit,intentos,imprime)
  nintent=0;
  radio=max(abs(p))/abs(p(1))+1;
  n=length(p)-1;
  prec=tol^(1/3);
  pd=p
  for k=1:n
    nintent=nintent+1
    try
      ang=rand();
      z0=radio*rand()*(cos(2*pi*ang)+i*sin(2*pi*ang));
      printf('Pto incial: %16.16e\t %16.16e\n',real(z0), imag(z0))
      [raicesd(k),app,nump]=newtonPoly(pd,z0,prec,maxit,imprime);
%      raicesd(k)
      [pd,val]=deflacion(pd,raicesd(k));
      [raices(k),app,nump]=newtonPoly(p,raicesd(k),tol,maxit,imprime);
%      raices(k)
    catch
      disp(['Error desde el método de Newton: ',lasterror.message])
      k=k-1;
    end_try_catch
    if (nintent>intentos)
      disp('Se ha sobrepasado el número máxmo de intentos')      
      return;
    endif
  endfor
endfunction






