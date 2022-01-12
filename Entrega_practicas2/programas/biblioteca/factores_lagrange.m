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
## @deftypefn {} {@var{retval} =} factores_lagrange (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: pablo <pablo@DESKTOP-DLP6F5H>
## Created: 2021-12-03

function coefLagr=factores_lagrange(nodos)
  
  n=length(nodos);
  coefLagr=zeros(n,n);
  vect=zeros(n,2);  #El vector de los monomios tipo (x-nodo(i)) representado [1,-nodo(i)]
  for i=1:n
    vect(i,:)=[1,-nodos(i)];
  endfor
  
  #productorio
  for i=1:n
    prod_denom=1;  #Esto es para el denominador (ese productorio de diferencias)
    result_iter=[1];

    for j=1:n
      if i~=j 
        prod_denom=prod_denom*(nodos(i)-nodos(j));
        result_iter=producto_polinomio_monomio(result_iter,vect(j,:));
        #Aqui hacemos uso de la funcion auxiliar para hacer los productos
        # PD: me dijiste que esto ya existía en octave, pero no lo sabia en ese
        # momento
      endif
      
##      Ahora creo que les tengo que dar la vuelta, ya que estan puestos
##      desde izquierda menor grado y derecha mayor grado.
      
    endfor
    coefLagr(i,:)=(1./(prod_denom)).*result_iter;
    coefLagr(i,:)=fliplr(coefLagr(i,:));
  endfor
  
endfunction
