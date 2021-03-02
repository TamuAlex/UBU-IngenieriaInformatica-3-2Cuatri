function [y,coef,coter]=hermite(nod,datos,x,opcion,M)

% Este programa calcula interpolación de Hermite.
% nod es un vector que contiene los nodos de la interpolación SIN REPETICIONES
% datos es una matriz de n filas y dos columnas. La primera columna contiene
% los datos de f f', etc. La segunda columna contiene 0 si el dato 
% correspondiente de la primera columna es dato de función, 1 si es dato
% de derivada etc.
% x es EL NÚMERO EN EL QUE va a evaluarse el polinomio
% y es el resultado de laevaluación.
% coef contiene los coeficientes del polinomio en base de Hermite.
% Si se conoce M que es el máximo de la derivada n-ésima en el mínimo
% intervalo que contiene a los nodos y a x puede calcularse la cota del
% error. (M hay que calcularla previamente). Si no se conoce puede
% ejecutarse [y,coef]=hermite(nod,datos,x,opcion)
% opcion toma los valores 0 (si no quiere representar nada), 1 (si se
% quiere representar solo el interpolante), 2 (si se quiere representar el
% interpolante y la función ), 3 si se quiere representar el error)
%
% [y,coef, cota]=hermite(nod,datos,x,opcion,M)

% Construcción de las diferencias divididas generalizadas.


coter=[];
n=length(datos);

A=zeros(n);

A(1,1)=nod(1);
A(1,2)=datos(1,1);
k=1;
ma=max(datos(:,2));

% Solo va a acudir a datos hasta que haya sacado todos los datos (es decir
% hasta que haya llegado a max(datos)


% Rellena los datos de funcion.


for i=2:n
  if datos(i,2)==0
	k=k+1;
	A(i,1)=nod(k);
	A(i,2)=datos(i,1);
  else
	A(i,1:2)=A(i-1,1:2);
  end
end

m=0;
	
% Rellena los datos de derivadas primera, segunda...

while m<ma
  m=m+1;
  
  for i=m+1:n
    if datos(i,2)>=m
	A(i,m+2)=datos(i-(datos(i,2)-m),1)/factorial(m);
    else
	A(i,m+2)=(A(i,m+1)-A(i-1,m+1))/(A(i,1)-A(i-m,1));
    end
  end
end


% Rellena los datos a partir de que ya se han usado todos los datos (como
% en Newton)

 for i=ma+3:n+1
    
   A(i-1:n,i)=(A(i-1:n,i-1)-A(i-2:n-1,i-1))./(A(i-1:n,1)-A(1:n+1-i+1,1));
 end
 
 nodeval=A(:,1);
 
 A=A(:,2:n+1);
 
coef=diag(A)';


% Evaluación del polinomio en el punto x

    y=evalnewe(x,coef,nodeval);
    
% Representaciones  


if opcion>0
    
    
fun=[];
for k=1:size(datos,1)
    if datos(k,2)==0
        fun=[fun,datos(k,1)];
    end
end

    
nod1=[nod,x];
m1=min(nod1);
m2=max(nod1);

x1=linspace(m1,m2);
y1=zeros(1,length(x1));


for i=1:length(x1)
    y1(i)=evalnewe(x1(i),coef,nodeval);
    
end

figure

if opcion==1
    
    plot(x1,y1,'blue',nod,fun,'go')
    y1=[];
elseif opcion==2
     plot(x1,funcion(x1),'r',nod,fun,'go')
     y1=[];
elseif opcion==3
     plot(x1,y1,x1,funcion(x1),nod,fun,'go')
     y1=[];
else
    plot(x1,abs(y1-funcion(x1)),nod,0,'go')
    y1=[];
end
end
%Cota del error

if nargin==4
    return
else

x2=x*ones(size(nodeval));
n1=1:n;
n2=prod(n1);
coter=prod(abs(nodeval-x2))*M/n2;

end