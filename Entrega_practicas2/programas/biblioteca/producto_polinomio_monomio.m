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
## @deftypefn {} {@var{retval} =} producto_polinomio_monomio (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: pablo <pablo@DESKTOP-DLP6F5H>
## Created: 2021-12-03

function res = producto_polinomio_monomio (v, mon)
  n=length(v);
  prod={};
  prod{1}=[];#term x
  prod{2}=[];#term ind
  
  #Yo voy a trabajar dos vectores y los trato como producto de polinomios
  # Lo puedo generalizar para prod de pols de grado n con pols de grado m
  # Pero he decidido dejarlo en producto de polinomios de grado 1 con grado n
  
  res=zeros(1,n+1); #las dimensiones de mi polinomio resultado
  for i=1:2
    for j=1:n
      prod{i}=[prod{i} (v(j)*mon(i))]; 
      #la parte del termino indep o la de la x, se multiplican todos los coef 
      #del pol de grado n con la a de (ax+b) y otro con la b
      
    endfor
  endfor
  
  res(1)=prod{2}(1);  #Calculamos el primero y ultimo que estan "empujados de
                      #posicion el uno respecto al otro asi como
                      #   [1,2,...,n-1]
                      # +   [2,...,n-1,n]
                      # = [1,2,...,n-1,n]
                      #Como digo, se pude genralizar a n x m pero ahora no lo necesito
                      #además de que he perdido el tiempo haceindo esto y que me
                      #acabo de enterar que está en octave implementado
                      
                      
  res(n+1)=prod{1}(n);
  if n~=1
    for k=2:n
      res(k)=prod{1}(k-1)+prod{2}(k);
    endfor
  endif
  
  
  resp=res(1,:);
  
endfunction

