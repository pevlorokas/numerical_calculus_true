%Ejer3
clc

printf("pi^2/6 = ")
ex=pi^2/6
sum=0;

format short g

for k=1:1:50
  sum=sum +(1/k^2);
  
endfor
sum

sum1=0;
for k=1:1:100
  sum1=sum1 +(1/k^2);
  
endfor
sum1

sum2=0;
for k=1:1:1000
  sum2=sum2 +(1/k^2);
  
endfor
sum2

sum3=0;
for k=1:1:10000
  sum3=sum3 +(1/k^2);
  
endfor
sum3

sum4=0;
for k=1:1:100000
  sum4=sum4 +(1/k^2);
  
endfor
sum4

sum5=0;
for k=1:1:1000000
  sum5=sum5 +(1/k^2);
  
endfor
sum5
printf("tablas \n")
%printf(mat2str(sum),mat2str(sum1),mat2str(sum2),mat2str(sum3),mat2str(sum4),mat2str(sum5))

printf(mat2str(sum));printf(" error: ");printf(mat2str(abs(ex-sum)/(ex)));printf("\n")
printf(mat2str(sum1));printf(" error: ");printf(mat2str(abs(ex-sum1)/(ex)));printf("\n")
printf(mat2str(sum2));printf(" error: ");printf(mat2str(abs(ex-sum2)/(ex)));printf("\n")
printf(mat2str(sum3));printf(" error: ");printf(mat2str(abs(ex-sum3)/(ex)));printf("\n")
printf(mat2str(sum4));printf(" error: ");printf(mat2str(abs(ex-sum4)/(ex)));printf("\n")
printf(mat2str(sum5));printf(" error: ");printf(mat2str(abs(ex-sum5)/(ex)));printf("\n")


printf("\n Ahora en precisión doble \n")
format long g




printf("pi^2/6 = ")
valor_exacto=pi^2/6
sum=0;
for k=1:1:50
  sum=sum +(1/k^2);
  
endfor
sum

sum1=0;
for k=1:1:100
  sum1=sum1 +(1/k^2);
  
endfor
sum1

sum2=0;
for k=1:1:1000
  sum2=sum2 +(1/k^2);
  
endfor
sum2

sum3=0;
for k=1:1:10000
  sum3=sum3 +(1/k^2);
  
endfor
sum3

sum4=0;
for k=1:1:100000
  sum4=sum4 +(1/k^2);
  
endfor
sum4

sum5=0;
for k=1:1:1000000
  sum5=sum5 +(1/k^2);
  
endfor
sum5

printf("extrav \n")

sum6=0;
for k=1:1:10000000
  sum6=sum6 +(1/k^2);
  
endfor
sum6



printf(mat2str(sum));printf(" error: ");printf(mat2str(abs(ex-sum)/(ex)));printf("\n")
printf(mat2str(sum1));printf(" error: ");printf(mat2str(abs(ex-sum1)/(ex)));printf("\n")
printf(mat2str(sum2));printf(" error: ");printf(mat2str(abs(ex-sum2)/(ex)));printf("\n")
printf(mat2str(sum3));printf(" error: ");printf(mat2str(abs(ex-sum3)/(ex)));printf("\n")
printf(mat2str(sum4));printf(" error: ");printf(mat2str(abs(ex-sum4)/(ex)));printf("\n")
printf(mat2str(sum5));printf(" error: ");printf(mat2str(abs(ex-sum5)/(ex)));printf("\n")






printf("con la funcion redondeo\n")

addpath('./Biblioteca')
global ndig=5

sum=0;
for k=1:1:50
  sum=redondeo(sum) +redondeo((1/k^2));
  
endfor
sum=redondeo(sum)

sum1=0;
for k=1:1:100
  sum1=redondeo(sum1) +redondeo((1/k^2));
  
endfor
sum1=redondeo(sum1)


sum2=0;
for k=1:1:1000
  sum2=redondeo(sum2) +redondeo((1/k^2));
  
endfor
sum2=redondeo(sum2)

sum3=0;
for k=1:1:10000
  sum3=redondeo(sum3) +redondeo((1/k^2));
  
endfor
sum3=redondeo(sum3)

sum4=0;
for k=1:1:100000
  sum4=redondeo(sum4) +redondeo((1/k^2));
  
endfor
sum4=redondeo(sum4)
"
sum5=0;
for k=1:1:1000000
  sum5=redondeo(sum5) +redondeo((1/k^2));
  
endfor
sum5=redondeo(sum5)
"
printf(mat2str(sum));printf(" error: ");printf(mat2str(abs(valor_exacto-sum)/(valor_exacto)));printf("\n")
printf(mat2str(sum1));printf(" error: ");printf(mat2str(abs(valor_exacto-sum1)/(valor_exacto)));printf("\n")
printf(mat2str(sum2));printf(" error: ");printf(mat2str(abs(valor_exacto-sum2)/(valor_exacto)));printf("\n")
printf(mat2str(sum3));printf(" error: ");printf(mat2str(abs(valor_exacto-sum3)/(valor_exacto)));printf("\n")
printf(mat2str(sum4));printf(" error: ");printf(mat2str(abs(valor_exacto-sum4)/(valor_exacto)));printf("\n")
%printf(mat2str(sum5));printf(" error: ");printf(mat2str(abs(valor_exacto-sum5)/(valor_exacto)));printf("\n")


clear 













