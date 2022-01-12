clc 
clear all
close all

addpath ('../biblioteca')

##
###a) v1
##printf('Apartado a) \n')
##N=20 
##t= linspace(-5,5,100);
##x= linspace(-5,5,N+1);
##f=@(x) 1./(1+x.^2);
##coefNew = interpolNewton(x,f(x));
##figure(1)
##plot(t, f(t),'r')
##hold on 
##plot(x, polyinterpolador_eval(coefNew,x,x), 'y')
##legend('Runge rojo, interpolador amarillo')
##hold off
##
##clear all
##close all
##printf('Pulse enter para ir a v2 apartado a) \n')
##
### v2 
##N=[5,10,15];
##t= linspace(-5,5,100);
##figure(2)
##for k=1:length(N)
##  x= linspace(-5,5,N(k));
##  f=@(x) 1./(1+x.^2);
##  coefNew = interpolNewton(x,f(x));
##  
##  plot(t, f(t))
##  hold on 
##  plot(x, polyinterpolador_eval(coefNew,x,x))
##  #legend('Runge rojo, interpolador amarillo')
## 
##endfor
##hold off
##printf('Pulse enter para ir a apartado b) \n')
##
##
###b)
##
##close all
##clear all
##
##N=15
##t= linspace(-5,5,100);
##x= linspace(-5,5,N+1);
##f=@(x) 1./(1+x.^2);
##coefNew = interpolNewton(x,f(x));
##
##figure(1)
##plot(t, f(t),'r')
##
##hold on 
##
##polim=polyinterpolador_eval(coefNew,x,t);
##plot(t, polim, 'y')
##legend('Runge rojo, interpolador amarillo')
##hold off
##
##figure(2)
##error=@(fun,pol) abs(fun.-pol);
##
##plot(t,error(f(t),polim))
##
##legend('Errores')
##printf('Pulse enter para ir a apartado b) \n')
##
##printf("El error maxinmo en muestra de 1000 puntos es: \n")
##x2_1=linspace(-5,5,1000);
##
##max(error(f(x2_1),polyinterpolador_eval(coefNew,x,x2_1)))

x=nodosCheby(-5,5,20);

t= linspace(-5,5,100);

f=@(x) 1./(1+x.^2);
coefNew = interpolNewton(x,f(x));
figure(1)
plot(t, f(t),'r')
hold on 
plot(x, polyinterpolador_eval(coefNew,x,x), 'y')
legend('Runge rojo, interpolador amarillo')
hold off

N=15


f=@(x) 1./(1+x.^2);


figure(3)
plot(t, f(t),'r')

hold on 

polim=polyinterpolador_eval(coefNew,x,t);
plot(t, polim, 'y')
legend('Runge rojo, interpolador amarillo')
hold off

figure(4)
error=@(fun,pol) abs(fun.-pol);

plot(t,error(f(t),polim))

legend('Errores')
printf('Pulse enter para ir a apartado b) \n')

printf("El error maxinmo en muestra de 1000 puntos es: \n")
x2_1=linspace(-5,5,1000);

max(error(f(x2_1),polyinterpolador_eval(coefNew,x,x2_1)))





N=3

t= linspace(-5,5,100);
figure(2)


x= linspace(-5,5,N(m));
f=@(x) 1./(1+x.^2);
v = interpolHermite(x,f(x));
coefN=v(1)
nod=v(2)
plot(t, f(t))
hold on 
plot(x, polyinterpolador_eval(coefN,nod,x))
      #legend('Runge rojo, interpolador amarillo')
     




