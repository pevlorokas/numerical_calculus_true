#pruebecillas

clc
close all
clear all
addpath('./biblioteca')

##
##cota_sup=0;
##cota_inf=0;
##
##neg=false;
##if polyval(pol7,-100)<0
##  neg=true
##  
##endif
##
##for k=-100:100
##  cota_inf=k-1;
##  if neg==true #En caso de empezar negativo
##    if polyval(d_pol7,k)<=0
##      cota_sup=k;
##      break;
##    endif
##  endif
##  
##  if neg==false #En caso de empezar positivo
##    if polyval(d_pol7,k)>=0
##      cota_sup=k;
##      break;
##    endif 
##  endif
##  
##  
##  
##endfor
##
##
##sep=linspace(cota_inf, cota_sup,100);
##
##for i=2:length(sep)
##  cota_inf=sep(i-1);
####  if polyval(d_pol7,sep(i))>=0 # por que si x se va a menos infinito el polinomio
####    # impar de coef negativo tambien se va a infinito
####    cota_sup=sep(i)
####    break;
####  endif
##  
##  if neg==true #En caso de empezar negativo
##    if polyval(d_pol7,sep(i))<=0
##      cota_sup=sep(i)
##      break;
##    endif
##  endif
##  if neg==false #En caso de empezar positivo
##    if polyval(d_pol7,sep(i))>=0
##      cota_sup=sep(i)
##      break;
##    endif
##  endif
##  
##  
##  
##endfor
##
##p=@(x) polyval(pol7,x);
##dp=@(x) polyval(polyder(pol7),x);
##
##[raiz1, valor_raiz1, pasos1] = newton(p, dp, cota_inf, 10^-10, 10000, 1)
## 
## 
## 
## 
## 
## 
#################################################################
################################################################# 
##
##
##cota_sup=0;
##cota_inf=0;
##neg==false
##if polyval(pol7,100)<0
##  neg==true
##endif
##
##for k=100:-1:-100
##  cota_sup=k+1
##  
##  if neg==true
##    if polyval(d_pol7,k)<=0
##      cota_inf=k
##      break;
##    endif
##  endif
##  
##  if neg==false
##    if polyval(d_pol7,k)>=0
##      cota_inf=k
##      break;
##    endif
##  endif
##  
##  
##endfor
##
##
##sep=linspace(cota_inf, cota_sup,100);
##
##for i=length(sep)-1:-1:1
##  cota_sup=sep(i+1)
##  
##  if neg==true
##    if polyval(d_pol7,sep(i))<=0 # por que si x se va a menos infinito el polinomio
##      # impar de coef negativo tambien se va a infinito
##      cota_inf=sep(i)
##      break;
##    endif
##  endif
##  
##  if neg==false
##    if polyval(d_pol7,sep(i))>=0
##      cota_inf=sep(i)
##      break;
##    endif
##  endif
##endfor
##
##
##[raiz7, valor_raiz7, pasos7]=newton(p,dp,cota_sup,10^-13,100,1)
##
####if pasos7>=100
####  sep=linspace(cota_inf, cota_sup,200);
####  for i=length(sep)-1:-1:1
####    cota_sup=sep(i+1)
####    if polyval(d_pol7,sep(i))>=0 # por que si x se va a menos infinito el polinomio
####      # impar de coef negativo tambien se va a infinito
####      cota_inf=sep(i)
####      break;
####    endif
####  endfor
####  [raiz7, valor_raiz7, pasos7]=newton(p, dp, cota_sup, 10^-16, 1000, 0)
####endif 
####
##
##
##
###MIRAMOS EL DEFLACIONADO
##
##[def_pol7,a] = deflacion(pol7,raiz1)
##d_def_pol7=polyder(def_pol7)
##
##
##t=linspace(0,5,200);
##figure(1)
##plot(t,polyval(def_pol7,t))
##hold off
##cota_inf=0;
##cota_sup=0;
##
##neg=false;
##if polyval(def_pol7,100)<0
##  neg=true;
##  
##endif
##
##for k=-100:100
##  cota_inf=k-1
##  if neg==true #En caso de empezar negativo
##    if polyval(d_def_pol7,k)<=0
##      cota_sup=k
##      break;
##    endif
##  endif
##  
##  if neg==false #En caso de empezar positivo
##    if polyval(d_def_pol7,k)>=0
##      cota_sup=k
##      break;
##    endif
##  endif
##  
##  
##  
##endfor
##
##
##sep=linspace(cota_inf, cota_sup,100);
##
##for i=2:length(sep)
##  
##  cota_inf=sep(i-1);
####  if polyval(d_pol7,sep(i))>=0 # por que si x se va a menos infinito el polinomio
####    # impar de coef negativo tambien se va a infinito
####    cota_sup=sep(i)
####    break;
####  endif
##  
##  if neg==true #En caso de empezar negativo
##    if polyval(d_def_pol7,sep(i))<=0
##      cota_sup=sep(i)
##      break;
##    endif
##  endif
##  
##  if neg==false #En caso de empezar positivo
##    if polyval(d_def_pol7,sep(i))>=0
##      cota_sup=sep(i)
##      break;
##    endif 
##  endif
##  
##endfor
##
##
##p=@(x) polyval(def_pol7,x);
##dp=@(x) polyval(polyder(def_pol7),x);
##
##[raiz1, valor_raiz1, pasos1] = newton(p, dp, cota_inf, 10^-16, 10000, 1)
##
##
##
format long g

##############################################################################
pol7 = polyLaguerre_solo(7)

d_pol7 = polyder(pol7)

raicespol7Laguerre = cerosLaguerre(pol7,100)

vals=polyval(pol7, raicespol7Laguerre)
#############################################################################

    ##if pasos7>=100
    ##  sep=linspace(cota_inf, cota_sup,200);
    ##  for i=length(sep)-1:-1:1
    ##    cota_sup=sep(i+1)
    ##    if polyval(d_pol7,sep(i))>=0 # por que si x se va a menos infinito el polinomio
    ##      # impar de coef negativo tambien se va a infinito
    ##      cota_inf=sep(i)
    ##      break;
    ##    endif
    ##  endfor
    ##  [raiz7, valor_raiz7, pasos7]=newton(p, dp, cota_sup, 10^-16, 1000, 0)
    ##endif 
    ##
    
    
    
    #MIRAMOS EL DEFLACIONADO
    
    ##  [def_pol7,a] = deflacion(pol7,raiz1)
    ##  d_def_pol7 = polyder(def_pol7)
##    figure(R)
##    plot(t,polyval(def_pol7,t))

##  
##  raices_limpias=[];
##  ant=0;
##  for m=2:length(raices)
##    ant=raices(m-1);
##    if (ant-raices(m))>=10^-10
##      raices_limpias=[raices_limpias raices(m)]
##      disp("Hola")
##    endif
##    
##  endfor
##  
##  raices=raices_limpias;
##  if polyval(d_pol7,sep(i))>=0 # por que si x se va a menos infinito el polinomio
      ##    # impar de coef negativo tambien se va a infinito
      ##    cota_sup=sep(i)
      ##    break;
      ##  endif
