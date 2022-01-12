addpath('C:/Users/marco/Desktop/practicasoctave/Biblioteca')

##Sea D(0, 1) el disco unidad en R^2, es decir, D(0, 1) = {(x, y) : x^2 + y^2 ? 1}

##F1(x) = integral e^(-y^2)dy
##intervalo1 = [-sqrt(1-x^2), sqrt(1-x^2)]
##
##F2(x) = integral e^(-x^2)*F1(x)dx
##intervalo2 = [-1, 1]

N = 100
f1 = @(y) e^(-y^2)


##Trapecio


t2 = @(x) e^(-x^2)*T1(f1, x, N)


function int = T1(f,x, N)
  if ((x <= 1) & (x >= -1))
    a = -sqrt(1-x^2);
    b = sqrt(1-x^2);
    int = trapecio(f, a, b, N);
  else
    print("Error")  ;
  endif
endfunction

function int = T2(N, f)
  a = -1;
  b = 1;
  int = trapecio(f, a, b, N);
endfunction


aproxTrap = T2(N, t2)

##Simson

s2 = @(x) e^(-x^2)*S1(f1, x, N)

function int = S1(f,x, N)
  if ((x <= 1) & (x >= -1))
    a = -sqrt(1-x^2);
    b = sqrt(1-x^2);
    int = simpson(f, a, b, N);
  else
    print("Error")  ;
  endif
endfunction

function int = S2(N, f)
  a = -1;
  b = 1;
  int = simpson(f, a, b, N);
endfunction

aproxSimp = S2(N, s2)