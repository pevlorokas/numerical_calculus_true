clear all
close all
clc

addpath('../biblioteca')

p1=[1,0,0,-5.6,10,-32];

p2=[3,-12,-1,23,-1,0,32,0,-123,12,-1,15]

p3=[5,0,0,-0.5,2,0.8,2,-1,0,32,0,-13,2,-1,-1]

raices1=newtonPolyAleatorio(p1,10^-10,1000,6,1)

raices2=newtonPolyAleatorio(p2,10^-10,1000,12,1)

raices3=newtonPolyAleatorio(p3,10^-10,1000,15,1)


raices={raices1,raices2,raices3};
#reconstruccion de polinomios

coefpol=[1]
pols={}
for r=1:3
  
  coefpol=[1]
  for k=1:length(raices{r})
    monomio=[1,-raices{r}(k)];
    coefpol=conv(coefpol,monomio);
    
  endfor
  
  pols{r}=coefpol
endfor

