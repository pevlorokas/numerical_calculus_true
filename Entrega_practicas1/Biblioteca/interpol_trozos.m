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
## @deftypefn {} {@var{retval} =} interpol_trozos (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: pablo <pablo@DESKTOP-DLP6F5H>
## Created: 2021-11-17

function A=interpol_trozos(z,x,y);
  m=length(z);
  d=length(x(1,:));  #Aqui hay d nodos
  
  if d ~= length(y(1,:)) or (m-1) ~= length(x(:,1))
    printf("Las dimensiones de x e y no coinciden")
  endif
  
  A=zeros(m-1,d);
  for i=1:m-1
    coef=interpolNewton(x(i,:),y(i,:));
    A(i,:)=polyinterpolador(coef,x(i,:));
  endfor

endfunction