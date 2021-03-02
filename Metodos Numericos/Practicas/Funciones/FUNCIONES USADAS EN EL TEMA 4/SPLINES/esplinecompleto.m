function [y,coef1,cota]=esplinecompleto(nod,fun,datder,x,opcion,M)
% Este programa calcula interpolación segmentaria por splines cúbicos
% completos
% nod son los nodos de interpolación, fun los datos de la función.
% datder es un vector con los valores f'(a) y f'(b)
% coef es una matriz de n filas y 4 columnas 
% en cada fila están los coeficientes del polinomio en cada subintervalo en
% base canónica (potencias de x en orden creciente).
% x es el vector donde se quiere evaluar el spline
% y es el valor del interpolante en x
% opcion toma los valores 0, 1,2,3 y 4 según que se quiera: (0) no prepresentar nada, (1) representar solo el
% interpolante, (2) solo la función,  (3) ambos y (4) representar solo el error.
% la función está en el archivo funcion.mth y hay que cambiarla en cada
% caso.
% Se puede calcular una cota del error en el intervalo definido por x si se
% conoce una cota de la derivada cuarta de f, M. Si no se conoce M utilizar
% la función [y,coef1]=esplinecompleto(nod,fun,datder,x,opcion);
%
% 
%[y,coef]=esplinecompleto(nod,fun,datder,x,opcion,M)

cota=[];
n=length(nod)-1;
% Construcción de la matriz

A=zeros(4*n);
B=zeros(4*n+1,1);

% Llenado de las ecuaciones que tienen que ver con f

for i=1:n
  A(2*i-1,4*i-3:4*i)=[1,nod(i),nod(i).^2,nod(i).^3];
  A(2*i,4*i-3:4*i)=[1,nod(i+1),nod(i+1).^2,nod(i+1).^3];
  B(2*i-1)=fun(i);
  B(2*i)=fun(i);
end
B(1)=[];
B(2*n)=fun(n+1);


% Llenado de las ecuaciones de las derivadas 1ª y 2ª

for i=1:n-1
  A(2*n+i,1+4*(i-1):4*(i+1))=[0,1,2*nod(i+1),3*nod(i+1).^2,...
0,-1,-2*nod(i+1),-3*nod(i+1).^2];
  A(3*n-1+i,1+4*(i-1):4*(i+1))=[0,0,2,6*nod(i+1),0,0,-2,...
-6*nod(i+1)];
end

A(4*n-1,3:4)=[2,6*nod(1)];
A(4*n,4*n-1:4*n)=[2,6*nod(n+1)];

% Condiciones espline completo

% espline completo

A(4*n-1,2:4)=[1,2*nod(1),3*nod(1).^2];
A(4*n,4*n-2:4*n)=[1,2*nod(n+1),3*nod(n+1).^2];

B(4*n-1)=datder(1);
B(4*n)=datder(2);

% A,B
% Coeficientes
% las incógnitas van ordenadas intervalo por intervalo
% y dentro de cada polinomio de grado menor a grado mayor.

coef=A\B;

% Evaluación del polinomio

y=[];

for j=1:length(x)
 v=nod-x(j)*ones(1,n+1);
 
 if x(j)<nod(1)
  aux=[1,x(j),x(j).^2,x(j).^3]*coef(1:4);
  y=[y,aux];
 else
 i=1;
 while v(i)<=0 && i<(n+1) 
 i=i+1;
 end

aux=[1,x(j),x(j).^2,x(j).^3]*coef(4*(i-2)+1:4*(i-1));
y=[y,aux];

 end
	
end	

% Coloco los coeficientes en una matriz para que se vean bien

l=length(coef);
l4=l/4;
for i=1:l4
   coef1(i,1:4)=coef(4*i-3:4*i);
end

% Dibujos
switch opcion
    
    case 1
        figure
    plot(x,y,'blue', nod,fun,'go')
    y=[];
    case 2
        figure
    plot(x,funcion(x),'r',nod,fun,'go')
    y=[];
    case 3
        figure
    plot(x,y,x,funcion(x),nod,fun,'go')
    y=[];
    case 4
        figure
        er=abs(y-funcion(x));
        fun1=zeros(size(fun));
        plot(x,er,nod,fun1,'go')
        y=[];

end

 % Cota del error

if nargin==5
     return
else
    nod1=[0,nod(1:n)];
    nod2=nod-nod1;
    nod2(1)=[];
    h=max(nod2);
 cota=(5*(h^4)*M)/384; 
end
