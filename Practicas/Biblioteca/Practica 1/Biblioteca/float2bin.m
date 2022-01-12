%Autor: A. Pallarés, curso 2020-21
% devuelve el redondeado de un numero (double) con 16 digitos en mantisa en base 2
% representado en punto fijo como una CADENA DE CARACTERES
% Usamos redondeo simetrico
% Prueba float2bin(0.1), o float2bin(0.625), o float2bin(pi) ....
% 
% usa las funciones de octave-matlab:
%       dec2bin(m) que devuelve una cadena de caracteres con la representación del número entero m en 
%                           base 2 (en binario)
%       mat2str(r) que devuelve la representación como cadena de caracteres del número r
%
function rx=float2bin(x)
b=2;  % base
format long g;
output_precision(16);
%output_max_field_width(16);


if(x==0)
  rx=0;
  return;
end
rx=1;
s=1;
mx=-x;
if (x>=0) 
  s=0; 
  mx=x; 
  end
%% EXPONENTE
c=0;
if (mx > b-1)
  while(mx >= b)
    c=c+1;
    mx = mx/b;
  end
%  x= (-1)^s mx b^c
else
  while(mx < 1)
    c=c-1;
    mx=mx*b;
  end
%  x= (-1)^s mx b^c
end   
rx=mat2str((-1)^s*eval(dec2bin(round(mx*b^(16))))*10^(c-16));
endfunction