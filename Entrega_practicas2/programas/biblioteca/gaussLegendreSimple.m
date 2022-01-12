%%  Autor: Salvador Sánchez-Pedreño
%%  Calcula la aproximación a una integral con la regla de Gauss en 
%%  Entrada:    
%%     - g es la funcion a integrar en el intervalo [-1,1]
%%     - nG es el número de puntos de Gauss. Los valores admitidos son los del vectoe M
%%       actualemnte 1,2,3,5,5 o 10. 
%%  La función utiliza los valores tabulados de abscisas y pesos tomados de internet
%%  Salida:  suma es el valor de la integral aproximada.
%              


function suma=gaussLegendreSimple(g,nG)
puntosG{1}=[0];
pesos{1}=[2];
puntosG{2}=[-0.577350269189626,0.577350269189626];
pesos{2}=[1,1];
puntosG{3}=[-0.774596669241483,0,0.774596669241483];
pesos{3}=[5/9,8/9,5/9];
puntosG{4}=[-0.861136311594053,-0.339981043584856,0.339981043584856,0.861136311594053];
pesos{4}=[0.347854845137454,0.652145154862546,0.652145154862546,0.347854845137454];
puntosG{5}=[-0.906179845938664,-0.538469310105683,0.0,0.538469310105683,0.906179845938664];
pesos{5}=[0.236926885056189,0.478628670499366,0.568888888888889,0.478628670499366,0.236926885056189];
puntosG{10}=[-0.97390652851717172,-0.865063366688984511,-0.679409568299024406,-0.433395394129247191,-0.148874338981631211,0.148874338981631211,0.433395394129247191,0.679409568299024406,0.865063366688984511,0.97390652851717172];	
pesos{10}=[0.066671344308688138,0.149451349150580593,0.219086362515982044,0.269266719309996355,0.29552422471475287,0.29552422471475287,0.269266719309996355,0.219086362515982044,0.149451349150580593,0.066671344308688138];

M=[1,2,3,4,5,10];
stop=0;
for k=1:length(M)
  if (nG==M(k)) 
    stop=1;
    break;
  endif
endfor
if (stop==0) 
  error('El número de puntos de Gauss requeridos no se contempla')
endif  

suma=0;
for k=1:nG
suma=suma+ pesos{nG}(k)*g(puntosG{nG}(k));
endfor         
endfunction

