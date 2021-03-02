function [y,coef,cota]=intseg11(nod,dat,x,opcion,M)
% Este programa calcula interpolación segmentaria lineal
% nod son los nodos de interpolación, dat los datos de la función.
% coef es una matriz de n filas y 2 columnas 
% en cada fila están los coeficientes del polinomio en cada subintervalo en
% forma de Newton
% x es el punto o vector donde se quiere evaluar el interpolante lineal
% y es el valor del interpolante en x
% opcion toma los valores 0, 1,2,3 y 4 según que se quiera: (0) no representar nada, (1) representar solo el
% interpolante, (2) solo la función,  (3) ambos y (4) representar solo el error.
% Si se quiere dibujar, x es el vector donde se quiere dibujar.
% la función está en el archivo funcion.mth y hay que cambiarla en cada
% caso. 
%
% El programa también calcula la cota del error en el intervalo definido
% si se conoce M. Si no se conoce usar [y,coef]=intseg11(nod,dat,x,opcion)
% 
%[y,coef,cota]=intseg11(nod,dat,x,opcion,M)
 


n=length(dat)-1;
cota=[];

%Cálculo de los coeficientes

coef1=dat(1:n);
coef2=(dat(2:n+1)-coef1)./(nod(2:n+1)-nod(1:n));
coef=[coef1',coef2'];

% Evaluación del polinomio 

y=[];

for j=1:length(x)
 v=nod-x(j)*ones(1,n+1);

  
 if x(j)<nod(1)
   y=[y,coef1(1)+coef2(1)*(x(j)-nod(1))];
   
 else
 
      i=1;
       while v(i)<=0 && i<(n+1) 
       i=i+1;
       end
       y=[y,coef1(i-1)+coef2(i-1)*(x(j)-nod(i-1))];
    
 end
 
	
end

%Cota del error

if nargin==5
    nod1=[0,nod(1:n)];
    nod2=nod-nod1;
    nod2(1)=[];
    h=max(nod2);
 cota=((h^2)*M)/8; 
end



% dibujos

switch opcion
    case 0
    return
    case 1
        figure
    plot(x,y,'blue', nod,dat,'go')
    y=[];
    case 2
        figure
    plot(x,funcion(x),'r',nod,dat,'go')
    y=[];
    case 3
        figure
    plot(x,y,x,funcion(x),nod,dat,'go')
    y=[];
    case 4
        figure
        er=abs(y-funcion(x));
        dat1=zeros(size(dat));
        plot(x,er,nod,dat1,'go')
        y=[];
end



