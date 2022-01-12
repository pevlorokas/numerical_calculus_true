## Copyright (C) 2022 Pablo
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <https://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {} {@var{retval} =} cerosLaguerre (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Pablo <Pablo@DESKTOP-IFS81MI>
## Created: 2022-01-09

function raices = cerosLaguerre (pol7, M)
  t=linspace(0,20,200);
  p=@(x) polyval(pol7,x);
  dp=@(x) polyval(polyder(pol7),x);
  def_pol7=pol7
  raices=[]
  
  for R=1:length(pol7)/2
    p=@(x) polyval(def_pol7,x);
    dp=@(x) polyval(polyder(def_pol7),x);
    
    
    cota_sup=0;
    cota_inf=0;
    d_def_pol7=polyder(def_pol7);
    neg=false;
    if polyval(def_pol7,-M)<0
      neg=true
      
    endif
    
    for k=-M:M
      cota_inf=k-1;
      if neg==true #En caso de empezar negativo
        if polyval(d_def_pol7,k)<=0
          cota_sup=k;
          break;
        endif
      endif
      
      if neg==false #En caso de empezar positivo
        if polyval(d_def_pol7,k)>=0
          cota_sup=k;
          break;
        endif 
      endif
      
      
      
    endfor
    
    
    sep=linspace(cota_inf, cota_sup,100);
    
    for i=2:length(sep)
      cota_inf=sep(i-1);
      ##  if polyval(d_pol7,sep(i))>=0 # por que si x se va a menos infinito el polinomio
      ##    # impar de coef negativo tambien se va a infinito
      ##    cota_sup=sep(i)
      ##    break;
      ##  endif
      
      if neg==true #En caso de empezar negativo
        if polyval(d_def_pol7,sep(i))<=0
          cota_sup=sep(i);
          break;
        endif
      endif
      if neg==false #En caso de empezar positivo
        if polyval(d_def_pol7,sep(i))>=0
          cota_sup=sep(i);
          break;
        endif
      endif
      
      
      
    endfor
    
    
    
    [raiz1, valor_raiz1, pasos1] = newton(p, dp, cota_inf, 10^-10, 10000, 0);
    
    
    
    ###############################################################
    ############################################################### 
    
    
    cota_sup=0;
    cota_inf=0;
    neg==false;
    if polyval(def_pol7,M)<0
      neg==true;
    endif
    
    for k=M:-1:-M
      cota_sup=k+1;
      
      if neg==true
        if polyval(d_def_pol7,k)<=0
          cota_inf=k;
          break;
        endif
      endif
      
      if neg==false
        if polyval(d_def_pol7,k)>=0
          cota_inf=k;
          break;
        endif
      endif
      
      
    endfor
    
    
    sep=linspace(cota_inf, cota_sup,100);
    
    for i=length(sep)-1:-1:1
      cota_sup=sep(i+1);
      
      if neg==true
        if polyval(d_def_pol7,sep(i))<=0 # por que si x se va a menos infinito el polinomio
          # impar de coef negativo tambien se va a infinito
          cota_inf=sep(i);
          break;
        endif
      endif
      
      if neg==false
        if polyval(d_def_pol7,sep(i))>=0
          cota_inf=sep(i);
          break;
        endif
      endif
    endfor
    
    
    [raiz7, valor_raiz7, pasos7]=newton(p,dp,cota_sup,10^-16,100,0);
    
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
    
    if abs(raiz1-raiz7)<10^-10
      raices=[raices raiz1];
    else
      raices=[raices raiz1];
      raices=[raices raiz7];
    endif
    
    [def_pol7,a] = deflacion(def_pol7,raiz1);
    
    if length(def_pol7)~=1
      [def_pol7,a] = deflacion(def_pol7,raiz7);
    endif
    
  endfor
  raices=sort(raices);
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
endfunction










