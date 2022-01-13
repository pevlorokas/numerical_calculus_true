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
## @deftypefn {} {@var{retval} =} sumaPoly (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Pablo <Pablo@DESKTOP-IFS81MI>
## Created: 2022-01-09

function pol = sumaPoly (p1, p2)  #Planteado para la suma de polinomios.
  n=length(p1);
  m=length(p2);
  
  nuevo1_menor=flip(p1);
  nuevo2_mayor=flip(p2);
  suma=zeros(1,max(n,m));
  
  if length(p1)==max(n,m) & length(p2)==min(m,n)
    nuevo1_menor=flip(p2);
    nuevo2_mayor=flip(p1);
    
  elseif length(p1)==min(n,m) & length(p2)==max(m,n)
    nuevo1_menor=flip(p1);
    nuevo2_mayor=flip(p2);
    
  endif
  
  for i=1:min(n,m)
    suma(i)=nuevo1_menor(i)+nuevo2_mayor(i);
  endfor
  
  for k=min(n,m)+1:max(n,m)
    suma(k)=nuevo2_mayor(k);
  endfor
  pol=flip(suma);
    
endfunction








