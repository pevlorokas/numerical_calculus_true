%% Autor: Antonio Pallarés 
%% Modificaciones de: salvador Sánchez-Pedreño
%%  Calcula la aproximación a una integral con la regla compuesta de Simpson
%%  Entrada:    
%%     - f es la funcion a integrar, introducida como una cadena de caracteres, o como una función interna.
%%     - a y b son los extremos del intervalo de integracion.
%%     - n es el número de subdivisiones del intervalo, se menejan entonces N=2*n+1 nodos
%%  Salida:  int es el valor de la integral aproximada.
%              


function int=simpson(f,a,b,n)
M=2*n;
h=(b-a)/M;
x=linspace(a,b,M+1);
for k=1:M+1
  y(k)=f(x(k));
endfor 
int=y(1)+y(M+1);
int=h/3*(int+4*sum(y(2:2:M))+2*sum(y(3:2:M-1)));
endfunction

