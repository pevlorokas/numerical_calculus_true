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
## @deftypefn {} {@var{retval} =} polyLaguerre (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Pablo <Pablo@DESKTOP-IFS81MI>
## Created: ¿2022-01-09?


#FUNCION AUXILIAR A POLYLAGUERRE


function g_n = polyLaguerre_solo(n)
  #Por medio de la recursividad tenemos que hacer que esto funcione
  g_n=[];
  
  
  #Mi idea con esto era que diese error si le pasabas mal un parametro, pero no tengo tiempo
  
##  if (n<0) 
##    display("ERROR: El valor introducido no es positivo")
##  elseif round(n)-n~=0
##    display("ERROR: El valor introducido no es entero")
##  endif

  
  #Casos base
  
  if n==1
    g_n=[-1,1];
   
  elseif n==0
    g_n=[1];
    
  
  else  #Caso generico para un natural
    g_n=(1./n).*sumaPoly(conv(([-1,2*n-1]),polyLaguerre_solo(n-1)), -(n-1).*polyLaguerre_solo(n-2));
    
  endif
  

endfunction
#fin



