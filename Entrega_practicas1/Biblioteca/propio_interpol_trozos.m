addpath('./Biblioteca')

##Recuerda que el número de nodos a interpolar en cada uno de los subintervalos
##es de d+1 (numero que ya me asegurare que coincida en la función o quizas la
##implemente de forma que me calcule polinomios de distintos grados.



##PARTE 1
## Escojo la primera opción, me parece mas interesante

function A=propio_interpol_trozos(z, x, y)#Los nodos y nudos ordenados, y ya los organizo.
  
  
  m=length(z);
  n=length(x);
  if n~=length(y)
    
  nxm_interv=[];
  #RECORDATORIO: aqui se empieza desde el 1 (lo cual genera mucha confusión), así que
  #va a ser común ver arrays de una dimension menor, como el de nodos por intervalo de nudos
  
    printf("ERROR: las dimensiones de los nodos y las abscisas no coinciden")
   
  endif
  
  for i=1:(m-1) # Necesito m-1 por que m es el numero de nudos, pero m-1 el de intervalos
    # Vamos a guardar todos los nodos entre nudo y nudo
    mxn_interv(i)=[];  #vamos a hacer un vector de vectores
    cont=0
    for j=1:n
      if z(i)<=x(j)<z(i+1)
        cont = cont +1     #cada vez que encuentre un nodo mas entre nudo y nudo, sube.
        mxn_interv(i)(cont)= x(j); #guardamos lo encontrado
        
      endif
    endfor
    
    
  endfor
  
  if z(m)=x(n)  # Las desigualdades de antes me dejan al untimo nodo fuera de la lista
    mxn_interv(m-1)=x(n);
  endif
  
  longitudes=[]
  for i=1:(m-1)
    longitudes(i)=length(mxn_interv(i)); # Esto es tan solo para saber cual es el pol de mayor grado
    
  endfor
  
  long_max=max(longitudes); #Ya sabemos la dimension de las filas de la matriz
  delete(longitudes); #para no dejar espacio innecesario en memoria
  
  A=zeros(long_max+1,m-1); #le sumamos 1 por que tengo 1,...,k_i nodos, entonces el grado es k_i + 1
  #De esta manera aquello que no se rellene se queda como coef 0
  suma=0
  for i=1:(m-1)
  
    if i==1
      A(i,:)=polyinterpolador(interpolNewton(mxn_interv(i),y(1:length(mxn_interv(i)))),mxn_interv(i));
    else
      #No esta en la forma de Newton, en  la forma de polinomio interpolador desarrollado
      suma=suma + length(mxn_interv(i-1));
      A(i,:)=polyinterpolador(interpolNewton(mxn_interv(i),y(suma:length(mxn_interv(i)))),mxn_interv(i));
##    Aqui solo he hecho que se recorran los elementos de las abscidas en correspondencia
##    al numero de nodos por intervalo de nudos
    endif
  endfor
  
   #Ya estaria todo donde debe estar :)
  

endfunction