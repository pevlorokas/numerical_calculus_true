close all
clear all
clc


addpath('../biblioteca')
#Comenzamos el ejercicio.
##Nos dan el polinomio p(z)= z^5 ? 5.6z^2 + 10z ? 32.

#a)

p_z=[1,0,0,-5.6,10,-32];

raices_pz=newtonPolyAleatorio(p_z,1/1000,10000,20,1)

#Aqui para ver cual es el disco que tomamos
ro=max(abs(raices_pz))

#b)
funcpol=@(x) polyval(p_z,x);
funcpol_deriv=@(x) polyval(polyder(p_z),x);
[aprox_raiz,valor_aprox_raiz,npasos]=newton(funcpol,funcpol_deriv,ro,10^(-10),1000,6,1)

##Polinomio deflacionado de p_z en la raiz real encontrada
p1_z=deflacion(p_z,aprox_raiz)
fp1_z=@(x) polyval(p1_z,x);
fdp1_z=@(x) polyval(polyder(p1_z),x);
[aprox_raiz2,valor_aprox_raiz2,npasos2]=newton(fp1_z,fdp1_z,ro,10^(-10),1000,6,1)
##No se encuentra ninguna raiz real


#d)
x=linspace(-3,3,200);
y=linspace(-3,3,200)'; # Cuidado: no olvides el apóstrofo final: es el vector traspuesto
z=abs(polyval(p_z,x+i*y)); # p es nuestro polinomio
contourf(x,y,z,0:0.5:10)
disp("Si se observa la ventana que nos ha salido, se puede ver por donde comienza a converger \n");

p_def={p1_z};
raices_otravez=[aprox_raiz];

ptos_init=[-1.55+1.78i,0.832+1.7233i,-1.55-1.54i,0.832-1.43i]
#e)
#ya tenemos p1_z
for k=1:4
  fp=@(x) polyval(p_def{k},x);
  dfp=@(x) polyval(polyder(p_def{k}),x);
  x0=ptos_init(k)
  
  [Raiz_aprox,imRaiz,npasos]=newton(fp,dfp,x0,10^-6,500,0)
  
  b_raiz=newton(funcpol,funcpol_deriv,Raiz_aprox,10^-10,1000,0)
  raices_otravez=[raices_otravez b_raiz];
  
  [pol_deflac,p_a]=deflacion(p_def{k},b_raiz);
  p_def{k+1}=pol_deflac



endfor

raices_otravez



#f)
coefpol=[1]

for k=1:length(raices_otravez)
  monomio=[1,-raices_otravez(k)];
  coefpol=conv(coefpol,monomio);
  
endfor

coefpol