clear all
function rx= redondeo (x)
global ndig;
rx=eval(mat2str(x,ndig));

endfunction


global ndig=4

a=redondeo(0.6688+0.3334)
b=redondeo(1000-0.05001)
c=redondeo(2.000*0.6667)
d=redondeo(25.00/16.00)

e_abs_a=abs(0.6688+0.3334-a)
e_abs_b=abs(1000-0.05001-b)
e_abs_c=abs(2.000*0.6667-c)
e_abs_d=abs(25.00/16.00-d)

e_rel_a= e_abs_a/(0.6688+0.3334)
e_rel_b= e_abs_b/(1000-0.05001)
e_rel_c= e_abs_c/(2.000*0.6667)
e_rel_d= e_abs_d/(25.00/16.00)



