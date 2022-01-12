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
## @deftypefn {} {@var{retval} =} polyinterpol_Hermite_a_trozos (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: pablo <pablo@DESKTOP-DLP6F5H>
## Created: 2021-12-01

function matriz = polyinterpol_Hermite_a_trozos (x,y,dy)
  matriz_coef=zeros(length(x)-1,4);   #Como es de grado 3 lospolinomios entonces el nº de columnas por coef es 4
  if length(x)~=length(y)
    disp("Error: las dimensiones de los nodos y sus imagenes no coinciden")
  endif
  printf("Aqui los coeficientes en la formade Newton, pero se devuelven los normales:\n\n")
  for i=1:length(x)-1
    nodos = [x(i),x(i+1)]; #Un par de nodos para la interpol
    imagen_derivada = {[y(i),dy(i)],[y(i+1),dy(i+1)]};
##    Ponemos en una celda las imagenes de los nodos y sus derivadas correspondientes

    [coef,nodos] = interpolHermite(nodos,imagen_derivada);
##    Le aplicamos la interpoalcion de hermite (los nodos son inutiles)
    matriz_coef(i,:) = coef; #Los guardamos
##    nodos(i,:)=[x(i),x(i),x(i+1),x(i+1)]

##  Voy a transformar la matriz de los coeficientes de newton en una matriz
##  con los coeficientes del polinomio desarrollado (No en la forma de newton)
##  Lo siento pero no me gusta nada la forma de newton por que lo complica mucho mas
    for m=1:length(matriz_coef(i,:))
      printf(mat2str(matriz_coef(i,m))); printf("\t");
    endfor
    printf("\n")
    matriz(i,:)=polyinterpolador(matriz_coef(i,:),nodos);
  endfor



endfunction
