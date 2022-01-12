## Copyright (C) 2021 pablo
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
## @deftypefn {} {@var{retval} =} polinomios_Lagrange (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: pablo <pablo@DESKTOP-DLP6F5H>
## Created: 2021-12-03


function pol_lagr=polinomios_lagrange(factoresLagrange,nodos,ordenadas)
  #Ojo, en esta funcion solo multiplico las ordenadas, por que creo que es lo que
  #me pide el ejercicio, que es dejarlo en la forma y_k*(productorio(x-x_j)/(x_i-x_j)
  
  #Luego ya lo sumare con funciones auxiliares que crearé.
  
  
  
  n=length(nodos)
  if n~=length(ordenadas)
    disp("Las dimensiones de x e y no coinciden")
  endif
  sum=0;
  
  pol_lagr=zeros(length(factoresLagrange(:,1)),length(factoresLagrange(1,:)));
  for i=1:length(factoresLagrange(:,1))
    pol_lagr(i,:)=ordenadas(i).*factoresLagrange(i,:); #Simplemente le multiplico las ordenadas
  endfor
  
endfunction