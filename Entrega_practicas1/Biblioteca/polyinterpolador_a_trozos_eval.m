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
## @deftypefn {} {@var{retval} =} polyinterpolador_a_trozos_eval (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: pablo <pablo@DESKTOP-DLP6F5H>
## Created: 2021-11-20

function y=polyinterpolador_a_trozos_eval(t ,matriz, nudos)
##El fin de esta funcion es separar los nodos en los intervalos nudo-nudo
##y calcular la imagen del polinomio interpolador que le corresponda, para 
##luego juntar todas las imagenes.  

  #mi vector de salida
  y=[];
  m=length(nudos);
  
  # Separamos los t entre nudo y nudo
  
  
  for j=1:m-1  # Un bucle para ver cada intervalo entre nudo y nudo.
    # en este vector guardare las abscisas que haya en el intervalo
    vecto=[];
    
    for i=1:length(t)
      #si la abscisas está en el intervalo, las guardo en vecto
      if (nudos(j)<= t(i)) && (t(i)<nudos(j+1)) 
        
        vecto=[vecto t(i)];  #añadiendolas poco a poco
        
      endif
      
      
    endfor 
    resul_vect=polyval(matriz(j,:),vecto); #le calculamos su valor en el
                                          #polinomio a las abcisas
    y=[y resul_vect];   #lo vamos metiendo dentro del vector salida
  endfor
  
  #como en el anterior condicional la desigualdad es estricta,
  #tenemos que barajar el caso en que un punto coincida con el ultimo nudo
  
  if t(length(t))==nudos(m)   
    y=[y polyval(matriz(m-1,:),t(length(t)))];  #en ese caso lo metemos dentro
  endif
  
  
endfunction
  
