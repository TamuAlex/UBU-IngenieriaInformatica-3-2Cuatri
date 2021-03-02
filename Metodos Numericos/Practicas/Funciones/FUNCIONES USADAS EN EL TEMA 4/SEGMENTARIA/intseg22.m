function [y,coef,cota]=intseg22(nod,dat,x,opcion,M)

% Este programa calcula interpolación segmentaria cuadrática EN LA FORMA 2
% POR LO TANTO LA MALLA DE NODOS DEBE SER UNIFORME
% nod son los nodos de interpolación, dat los datos de la función.
% LA LONGITUD DE nod HA DE SER IMPAR.
% coef es una matriz de n/2 filas y 2 columnas 
% en cada fila están los coeficientes de la parábola en cada PAR DE SUBINTERVALOS en
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

% Verificación de que la longitud de nod es par

if rem(n,2)~=0
  disp('el número de datos no es adecuado. No se puede hacer interpolación cuadrática')
  return
end

%Cálculo de los coeficientes

for j=1:n/2

A(:,1)=dat(2*j-1:2*j+1)';
nod1=nod(2*j-1:2*j+1)';
coef(1,j)=A(1,1);

  for i=2:3
  A(i:3,i)=(A(i:3,i-1)-A(i-1:2,i-1))./(nod1(i:3)-nod1(1:4-i));

  coef(i,j)=A(i,i);
  end

end

% Evaluación del polinomio 

y=[];

for j=1:length(x)
   
 if x(j)<=nod(1)
   y=[y,coef(1,1)+coef(2,1)*(x(j)-nod(1))+coef(3,1)*(x(j)-nod(1)).*(x(j)-nod(2))];
    
 else  
    
     v=nod(1:2:n+1)-x(j)*ones(1,n/2+1);
    
      i=1;
       while v(i)<0 && i<n/2+1 
       i=i+1;
       end
       
      i=i-1;
    
  y=[y,coef(1,i)+coef(2,i).*(x(j)-nod(2*i-1))+coef(3,i)*(x(j)-nod(2*i-1))*(x(j)-nod(2*i))];
 
 end	
end

coef=coef';

%Cota del error FORMA 2

if nargin==5
   h=nod(2)-nod(1);% no olvidemos que la malla es uniforme
 cota=((h^3)*M*sqrt(3))/27; 
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



