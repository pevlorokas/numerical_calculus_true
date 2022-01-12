close all
clc
x=[1,-1,2,-2]

x<0

if x<0 
  disp('negativo')
 
else 
  disp('positivo')

endif

x=[-1,1,-2,2]

if x<0
  disp('negativo')
else
  disp('positivo')
endif

x=[1,2,3,4]

if x<0
  disp('negativo')
else
  disp('positivo')
endif

x=[-1,-2,-3,-4]

if x<0
  disp('negativo')
else
  disp('positivo')
endif
% a)


x1=[1,-1,2,-2];
f=@(x) -x.*(x<0)+x.*(x>=0)

f(x)

%pruebas 
printf("pruebas \n Sucecion (-1)^n sin modificar: \n ")
for k=1:1:50
  (-1).^k


endfor
printf("\n ahora con la función f: \n")

for k=1:1:50
  f((-1).^k)


endfor

%b) este es muy facil

function ret=f(x)
  for i=1:length(x)
    if (x(i)<0)
      ret(i)=-x(i);
    else
      ret(i)=x(i);
    endif
  endfor
endfunction

f([-1,2,-3,-10])

%c) IMPORTANTE


f1=@(x1) -1*(x1<=-2)+((x1+2).^2).*(-2<x1 & x1<2)+15*(x1>=2)
x=linspace(-5,5,3000);
figure(1)
plot(x,f1(x))


e=f1(-3)




