%Autor: Antonio Pallarés, curso 2020-21
%devuelve el redondeado de un numero (double) con d digitos en mantisa. Todo en base 10
% Usamos redondeo simétrico
function rx= redondeo (x)
global ndig;
rx=eval(mat2str(x,ndig));

endfunction