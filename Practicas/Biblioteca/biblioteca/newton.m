%% Autor: Antonio Pallarés
%% Modificaciones de: Salvador Sánchez-Pedreño
%% Método de Newton para aproximar ceros de la función continua f 
%% Entradas:
%%    - f, función (se escribe "f" entre comillas si la funcion es externa, cuando es interna se escribe f sin comillas)
%%    - df, función derivada de f
%%    - x0, punto inicial para el método
%%    - tol, tolerancia, estimación del error para detener la iteración
%%    - maxit, número máximo de iteraciones del método
%%    - imprime, si toma el valor 1 se imprime una tabla de los valores itermedios
%% Salidas:
%%     - x, aproximacion a una solucion
%%     - fx, el valor de f(x)
%%     - npasos, número de iteraciones realizadas
%% Los criterios de parada utilizados son:
%% la diferencia entre dos iteraciones sucesivas es menor que tol en cierto sentido relativo y a la vez fx<tol
%% y que se sobrepase el número maxit de iteraciones, en cuyo caso enviará un error.

function [x,fx,npasos]= newton(f, df,x0,tol, maxit,imprime)
  npasos=1;
  x=x0;
  fx=f(x);
  dfx=df(x);
  fmt='%5u\t %+17.17f\t %+17.17f\t %+17.17e\n';
if (imprime==1) 
    printf(fmt,npasos,x,fx,dfx)
endif          
    while npasos <= maxit
      npasos = npasos +1;
      if( abs(dfx)<10*eps )
        disp('Newton: derivada nula');
        return
      end
      deltax=fx/dfx;
      x=x-deltax;
      fx=f(x);
      dfx=df(x);
      if (imprime==1) 
       printf(fmt,npasos,x,fx,dfx)
      endif                  
      if and((abs(deltax)<=tol*(1+abs(x))),(abs(fx)<=tol) )      
        return;
      endif
   endwhile
   disp('No hay convergencia del método de Newton');  
   return;     
end






