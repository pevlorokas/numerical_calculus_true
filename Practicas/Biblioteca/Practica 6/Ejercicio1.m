close all
clear all
clc

addpath('../biblioteca')

f=@(x) sqrt(x);


#a)
trap_a=[];
simp_a=[];
gauss_a=[];
trap_a_plus=[];
simp_a_plus=[];
gauss_a_plus=[];

for k=1:11
  trap_a=[trap_a trapecio(f,0,1,2^k)];
  simp_a=[simp_a simpson(f,0,1,2^k)];
  gauss_a=[gauss_a gaussLegendre(f,0,1,2^k,5)];
  trap_a_plus=[trap_a_plus trapecio(f,0,1,2^(k+1))];
  simp_a_plus=[simp_a_plus simpson(f,0,1,2^(k+1))];
  gauss_a_plus=[gauss_a_plus gaussLegendre(f,0,1,2^(k+1),5)];
endfor

form='%8u\t\t %16.14e\t\t %16.14e\t\t %16.14e\t\t  \n';
form_e='%8u\t\t %16.14e\t\t %16.14e\t\t %16.14\t\t \n' ;
printf('valores \n')
for i=1:11
  
  #disp('nº Subintervalos: ')
  printf(form,2^i, trap_a(i), simp_a(i), gauss_a(i))
  #printf('\n \n')
  
endfor
#printf('\n Errores. Filas: Nº subintervalos, Columnas: trapecio, simpson, gaussLegendre')




error_trap=[];
error_simp=[];
error_gauss=[];
error_trap_plus=[];
error_simp_plus=[];
error_gauss_plus=[];



for j=1:11
  error_trap=[error_trap abs(2/3-trap_a(j))];
  error_simp=[error_simp abs(2/3-simp_a(j))];
  error_gauss=[error_gauss abs(2/3-gauss_a(j))];
  error_trap_plus=[error_trap_plus abs(2/3-trap_a_plus(j))];
  error_simp_plus=[error_simp_plus abs(2/3-simp_a_plus(j))];
  error_gauss_plus=[error_gauss_plus abs(2/3-gauss_a_plus(j))];
  
  
  printf(form, 2^j, error_trap(j)/error_trap_plus(j), error_simp(j)/error_simp_plus(j), error_gauss(j)/error_gauss_plus(j))
  #printf(mat2str(2^j));printf('\t'); printf(mat2str(error_trap(j)/error_trap_plus(j)));printf('\t'); printf(mat2str(error_simp(j)/error_simp_plus(j)));printf('\t'); printf(mat2str(error_gauss(j)/error_gauss_plus(j)))
  #b)
  
  
  
endfor
#b)
f=@(x) x.^(3/2);


trap_a=[];
simp_a=[];
gauss_a=[];
trap_a_plus=[];
simp_a_plus=[];
gauss_a_plus=[];

for k=1:11
  trap_a=[trap_a trapecio(f,0,1,2^k)];
  simp_a=[simp_a simpson(f,0,1,2^k)];
  gauss_a=[gauss_a gaussLegendre(f,0,1,2^k,5)];
  trap_a_plus=[trap_a_plus trapecio(f,0,1,2^(k+1))];
  simp_a_plus=[simp_a_plus simpson(f,0,1,2^(k+1))];
  gauss_a_plus=[gauss_a_plus gaussLegendre(f,0,1,2^(k+1),5)];
endfor

form='%8u\t\t %16.14e\t\t %16.14e\t\t %16.14e\t\t  \n';
form_e='%8u\t\t %16.14e\t\t %16.14e\t\t %16.14\t\t \n' ;
printf('valores \n')
for i=1:11
  
  #disp('nº Subintervalos: ')
  printf(form,2^i, trap_a(i), simp_a(i), gauss_a(i))
  #printf('\n \n')
  
endfor
#printf('\n Errores. Filas: Nº subintervalos, Columnas: trapecio, simpson, gaussLegendre')




error_trap=[];
error_simp=[];
error_gauss=[];
error_trap_plus=[];
error_simp_plus=[];
error_gauss_plus=[];



for j=1:11
  error_trap=[error_trap abs(2/5-trap_a(j))];
  error_simp=[error_simp abs(2/5-simp_a(j))];
  error_gauss=[error_gauss abs(2/3-gauss_a(j))];
  error_trap_plus=[error_trap_plus abs(2/5-trap_a_plus(j))];
  error_simp_plus=[error_simp_plus abs(2/5-simp_a_plus(j))];
  error_gauss_plus=[error_gauss_plus abs(2/5-gauss_a_plus(j))];
  
  
  printf(form, 2^j, error_trap(j)/error_trap_plus(j), error_simp(j)/error_simp_plus(j), error_gauss(j)/error_gauss_plus(j))
  #printf(mat2str(2^j));printf('\t'); printf(mat2str(error_trap(j)/error_trap_plus(j)));printf('\t'); printf(mat2str(error_simp(j)/error_simp_plus(j)));printf('\t'); printf(mat2str(error_gauss(j)/error_gauss_plus(j)))
  #b)
  
  
  
endfor










