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
## Created: 2022-01-09

#Como funcion auxiliar se usara polyLaguerre_solo que devuelve el polinomio
#de grado n.

function matriz = polyLaguerre (n)
  matriz=zeros(n+1,n+1);
##  matriz(1,n+1)=1;
  for i=0:n
    plag=flip(polyLaguerre_solo(i));
    fila=zeros(1,n+1);
    for j=1:i+1
      fila(j)=plag(j);
      
    endfor
    matriz(i+1,:)=flip(fila);
  endfor
  
  
  
endfunction






