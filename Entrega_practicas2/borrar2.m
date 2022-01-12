addpath('C:/Users/17alr/octave/biblioteca')
#1.
k=7;
celdas= polyLaguerre(k)
#2.
raices = cerosLaguerre(celdas)
raices2= roots(celdas{8})
for i =1:length(raices)
  raices_laguerre(i)= raices(length(raices)+1-i);
endfor   
#3. Utilizando la función creada en el ejercicio 3 de la entrega de prácticas 1,
#calcula los coeficientes de Lagrange L1(x), . . . , L7(x), correspondientes a 
#los ceros aproximados x1, . . . , x7. Si no hiciste este ejercicio en la 
#primera entrega, este es buen momento de retomarlo
factores = LiLagrange(raices_laguerre);
#4.Los pesos buscados son combinacion lineal de los factores de lagrange.
# ck es la integral de e^k por un polinomio de Lagrange que es una fila de esas
polyout(factores(1, :) , 'x');
# integral entre 0 , inf e^(-x)*coef*x^6
#sería el factorial del grado por el coef de la x 
#grado es 6
#el del ultimo coef es el coef 
pesos_laguerre= [];
for i =1:7
alpha= [];
pesos_laguerre(i) =0;
t=6;
for k=1:length(factores(1, :))
  alpha(k)= (factorial(t))*factores(i , k);
  pesos_laguerre(i)= pesos_laguerre(i)+alpha(k);
  t=t-1;
endfor 
endfor 
#5. Finalmente obtén la aproximación de la integral para el método de 
#Gauss-Laguerre (con 7 puntos).Para la funcion celdas{8}
imagenes= polyval(celdas{8} , raices_laguerre);
aproximacion=0;
for i=1:length(imagenes)
  aproximacion = aproximacion + (pesos_laguerre(i))*(imagenes(i));
endfor   
aproximacion#Integral es el valor de la aproximación 
#6. Comprueba el valor de las siguientes integrales, debe dar 1.
f= @(x) x;
imagenes_fx= f(raices_laguerre);
integral2=0;
for i =1:length(imagenes_fx)
  integral2= integral2+((pesos_laguerre(i))*(imagenes_fx(i)));
endfor   
integral2
#7. Aplica todo lo anterior para aproximar las integrales
g= @(x) x*cos(x);
integralg=0;
for i =1:length(raices_laguerre)
  integralg= integralg+ ((pesos_laguerre(i))*(g(raices_laguerre(i))));
endfor 
integralg 

h= @(x) exp(-x^(2)+2*x);
integralh=0;
for i =1:length(raices_laguerre)
  integralh= integralh + ((pesos_laguerre(i))*(h(raices_laguerre(i))));
endfor 
integralh  


  










