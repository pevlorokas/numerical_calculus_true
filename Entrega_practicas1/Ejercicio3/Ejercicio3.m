clear all
close all
clc

addpath('../Biblioteca')

#1)
inicio_reinicio=0;

#Esto podría haberlo integrado en la funcion de polinomios pero creo que no
#es lo que se pedía.
function sum= suma_coef_lagrange(mat)
    sum=zeros(1,length(mat(1,:)));
    n=length(mat(:,1));
    for i =1:n
      sum=sum + mat(i,:);
    endfor
    
  endfunction
  

while inicio_reinicio==0
  
  close all
  clc
  
  display("Funciones que vamos a usar \n\n")
  disp("Principales: \n")
  disp("Apartado 1: factores_lagrange: te devuelve los factores introduciendo los nodos\n")
  disp("Apartado 2: polinomios_lagrange: te devuelve los polinomios anteriores multiplicados por las ordenadas")
  disp("ya despues se hace la suma de estos y el resultado es el polinomio final\n\n")
  disp("Funciones auxiliares: \n")
  disp("suma_coef_lagrange: te hace la suma de los coeficientes cuyo resultado es el polinomio final (pd")
  disp("esto se podría haber hecho dentro de la función pero creo que no es lo que me pides.\n")
  disp("producto_polinomio_monomio: te hace el producto de un polinomio a_0*x^0+...+a_x*x^n por un monomio de la forma ax+b (dentro ")
  disp("de la propia funcion hay información de la estupida razón por la que hice esta función)\n\n\n")
  
  disp("Apartado 3: \n \n")
  m=input("Elige tú el numero de nodos de 0 a 2pi, escribelo aquí: ")
  
  inicio=0;
  fin=2*pi;
  
  nodos=linspace(inicio,fin,m)
  t=linspace(0,pi*2,200);
  
  #Funcion auxiliar para sumar los polinomios de lagrange (cuyo resultado es el
  #polinomio interpolador en su forma normal)
  
  
  
  
  ## Ahora dados los nodos, vamos acerle los factores y luego ya le hacemos 
  ## todo lo demás
  sin(nodos)
  facts_lagr=factores_lagrange(nodos)
  
  pols_lagra_sep=polinomios_lagrange(facts_lagr,nodos, sin(nodos))
  
  pol_lagrange=suma_coef_lagrange(pols_lagra_sep)
  #Pd esto es un polinomio normal, osea que usare polyval para evaluarlo.
  
  
  coefNewton=interpolNewton(nodos,sin(nodos))
  #Unos me lo evaluan de una forma y otros de otra de verdad que lio
  #me llevan las funciones de octave y nuestras funciones aparte
  desarrollo_pol_newton=polyinterpolador(coefNewton,nodos,sin(nodos))
  
  
  figure(1) #grafica de aprox
  plot(t,sin(t))
  axis([inicio,fin,-1.5,1.5]);
  hold on
  plot(t,polyval(pol_lagrange,t))
  hold on
  plot(t,polyinterpolador_eval(coefNewton, nodos,t));
  legend('sin(x)','polinomio interpolador Lagrange','polinommio interpolador Newton')
  title("Comparacion graficas polinomios, y sin(x)")
  hold off
  
  figure(2)
  plot(t,abs(polyval(pol_lagrange,t)-sin(t)));
  hold on
  plot(t, abs(polyinterpolador_eval(coefNewton,nodos,t)-sin(t)));
  legend("Error pol Lagrange c.r.a sin(x)","Error pol Newton c.r.a sin(x)");
  title("Errores")
  hold off
  
  
  
  disp("la diferencia de los coeficientes de ambos polinomios: \n\n\n")
  pol_lagrange-desarrollo_pol_newton
  
  disp("Como se puede ver, la diferencia es nula ya que de uno sale el otro polinomio, asi que son el  mismo.\n\n\nApartado 4, pulsa para avanzar: ")
  pause
  disp("\n Vamos a ver que ocurre cuando le ponemos 45 nodos a los polinomios: \n\n")
  
  nodos=linspace(inicio,fin,45);
  disp("Se viene un bombardeo de datos, pulsa para ver: ")
  pause
  
  facts_lagr=factores_lagrange(nodos)
  
  pols_lagra_sep=polinomios_lagrange(facts_lagr,nodos, sin(nodos))
  
  pol_lagrange=suma_coef_lagrange(pols_lagra_sep)
  coefNewton=interpolNewton(nodos,sin(nodos))
  desarrollo_pol_newton=polyinterpolador(coefNewton,nodos,sin(nodos))
  
  figure(3)
  plot(t,sin(t))
  axis([inicio,fin,-3,3]);
  hold on
  plot(t,polyval(pol_lagrange,t));
  legend('sin(x)','polinomio de Lagrange')
  title("Polinomios de lagrange valores grandes")
  hold on
  
  disp("Como se puede apreciar, el polinomio se nos va a la verga, ya sabíamos que el coste de evaluacion \nde esta función no era pequeño, supongo que se debe a la cantidad de error arrastrado durante la práctica.")

  
  disp("FIN DEL EJERCICIO Y DE LA PRACTICA")
  
  inicio_reinicio= input("¿Reiniciar el programa para meter otros datos? En caso negativo se avanzará al siguiente apartado sí: 0 ; no: 1, responde: ")
  


endwhile