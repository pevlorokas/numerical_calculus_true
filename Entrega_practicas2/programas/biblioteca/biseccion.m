%% Autor: Antonio Pallarés
%% Modificaciones de: Salvador Sánchez-Pedreño
%% Método de la bisección para aproximar ceros de la función continua f 
%% supuesto  sign(f(a))*sign(f(b)) < 1 
%% Entradas:
%%    - f, función (se escribe "f" entre comillas si la funcion es externa, cuando es interna se escribe f sin comillas)
%%    - a, b extremos del intervalo donde f cambia de signose escribe "f" entre comillas 
%%    - tol, tolerancia, estimación del error para detener la iteración
%%    - imprime, si toma el valor 1 se imprime una tabla de los valores itermedios
%% Salidas:
%%     - x, aproximacion a una solucion
%%     - fx, el valor de f(x)
%%     - npasos, número de iteraciones realizadas
%% Los criterios de parada utilizados son:
%% la diferencia entre dos iteraciones sucesivas es menor que tol en cierto sentido relativo y a la vez fx<tol/2
%% También se utiliza la estimación teórica del máximo de iteraciones (maxit) para detener la iteración por si hubiera errores

function [x,fx,npasos]= biseccion(f,a,b,tol,imprime)
  npasos=1;
  aa=a;
  fa=f(aa);
  bb=b;
  fb=f(bb);
  fmt='%5u\t %+17.17f\t %+17.17f\t %+17.17e\t %+17.17e\n';
  x=a;
  fx=fa;
  maxit=ceil((log(b-a)-log(tol))/log(2));
    if sign(fa)*sign(fb) > -1
     error(' Biseccion: f no cambia de signo en a,b ');
    endif
    if (imprime==1) 
      printf(fmt,npasos,aa,bb,fa,fb)
    endif
    while ( (abs(bb-aa)>tol*(1+abs(aa))) || (abs(fc)>tol)  )     
      if (npasos>=maxit)
         x=c;
         fx=fc;
        return
      endif
      npasos = npasos +1;
      c=aa+0.5*(bb-aa);
      fc=f(c);
      if sign(fa)*sign(fc) < 1
        bb=c;
        fb=fc;
      else
        aa=c;
        fa=fc;
      endif     
      if (imprime==1) 
        printf(fmt,npasos,aa,bb,fa,fb)
      endif       
   endwhile
   x=c;
   fx=fc;
end






