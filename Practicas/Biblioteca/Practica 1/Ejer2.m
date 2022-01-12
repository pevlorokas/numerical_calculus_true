clear all
clc
addpath('./Biblioteca')
global ndig=4
polinomio="1.002x^2-11.01x+0.01265"
a_ex=1.002
b_ex=-11.01
c_ex=0.01265
a=redondeo(1.002)
b=redondeo(-11.01)
c=redondeo(0.01265)
printf('\n')
paso11=redondeo(b^2)
paso12=redondeo(-4*a*c)
paso13=redondeo(paso11+paso12)
paso14=redondeo(sqrt(paso13))
paso15=redondeo(-b+paso14)
solPos=redondeo(paso15/redondeo(2*a))
printf('\n')
paso21=redondeo(b^2)
paso22=redondeo(-4*a*c)
paso23=redondeo(paso21+paso22)
paso24=redondeo(sqrt(paso23))
paso25=redondeo(-b-paso24)
solNeg=redondeo(paso25/redondeo(2*a))

ex_pos=(-(b_ex)+sqrt(b_ex^2-4*a_ex*c_ex))/(2*a_ex);
ex_neg=(-(b_ex)-sqrt(b_ex^2-4*a_ex*c_ex))/(2*a_ex);

printf("Las soluciones exactas del polinomio son: ")
printf('\n')
printf("positiva: ")
printf(mat2str(ex_pos))
printf('\n')
printf("negativa: ")

printf(mat2str(ex_neg))
printf('\n')

v=poly[a_ex,b_ex,c_ex]
polyout(v,'x')

