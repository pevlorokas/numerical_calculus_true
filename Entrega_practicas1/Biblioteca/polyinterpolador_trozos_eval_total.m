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
## @deftypefn {} {@var{retval} =} polyinterpolador_trozos_eval (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: pablo <pablo@DESKTOP-DLP6F5H>
## Created: 2021-11-17


function y=polyinterpolador_trozos_eval_total(t , matriz_coef, nudos,ind);
  #Recordemos que me dan la matriz de coefiientes de newton, cosa que habria
  #cambiado en el apartado anteior dando el polinomio directamente.
##  matriz=polyinterpolador(matriz_coef(ind,:));
  
  y=polyval(matriz_coef(ind,:),t);

  
  
endfunction