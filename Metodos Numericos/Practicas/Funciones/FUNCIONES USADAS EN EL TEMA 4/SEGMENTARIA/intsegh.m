function [y,coef,cota]=intsegh(nod,datf,datd,x,opcion,M)
%
% esta función calcula interpolación segmentaria de Hermite
% nod es un vector que contiene los nodos de interpolación
% datf es un vector que contiene los datos de la función en los nodos
% datd es un vector que contiene los datos de la derivada en los nodos
% x es el punto o vector donde se quiere conocer la aproximación
% si se quiere dibujar el interpolante, x tiene que ser la malla donde se
% dibuje.
% y es el valor de la aproximación en x
% coef es una matriz de 4 columnas y n filas que en cada fila da los 
% coeficientes del polinomio interpolador de Hermite en el correspondiente
% intervalo.
% opcion toma los valores 0, 1,2,3 y 4 según que se quiera: (0) no prepresentar nada, (1) representar solo el
% interpolante, (2) solo la función,  (3) ambos y (4) representar solo el error.
% la función está en el archivo funcion.mth y hay que cambiarla en cada
% caso.
% El programa también calcula la cota del error en el intervalo definido
% si se conoce M. Si no se conoce usar  [y,coef]=intseg11(nod,datf,datd,x,opcion)
%
% [y,coef]=intsegh(nod,datf,datd,x,opcion,M)


% Cálculo de los coeficientes

n=length(nod)-1;
cota=[];

for i=1:n

   n1=nod(i);n2=nod(i+1);f1=datf(i);f2=datf(i+1);d1=datd(i);d2=datd(i+1);
   dif=n2-n1;
   A(:,1)=[f1,f1,f2,f2]';
   A(:,2)=[0,d1,(f2-f1)/dif,d2]';

   for j=3:4
      A(:,j)=(A(:,j-1)-[0;A(1:3,j-1)])./dif;
   end

   coef(i,:)=diag(A)';

end

% Evaluación del polinomio


y=[];

for j=1:length(x)
 v=nod-x(j)*ones(1,n+1);

 if x(j)<nod(1)
     aux1=x(j)-nod(1);
     aux2=aux1.^2;
     aux3=x(j)-nod(2);     
     y=[y,coef(1,1)+coef(1,2)*aux1+coef(1,3)*aux2+coef(1,4)*aux2*aux3];
 else
    i=1;
    while v(i)<=0 && i<(n+1) 
    i=i+1;
    end
      aux1=x(j)-nod(i-1);
      aux2=aux1.^2;
      aux3=x(j)-nod(i);
      y=[y,coef(i-1,1)+coef(i-1,2)*aux1+coef(i-1,3)*aux2+coef(i-1,4)*aux2*aux3];
 end
end	

% Cota del error

if nargin==6
    nod1=nod(2:n+1);
    nod2=nod(1:n);
    dif=nod1-nod2;
    h=max(dif);
    cota=h^4/384*M;
end


switch opcion
    case 0
    return
    case 1
        figure
    plot(x,y,'blue', nod,datf,'go')
    y=[];
    case 2
        figure
    plot(x,funcion(x),'r',nod,datf,'go')
    y=[];
    case 3
        figure
    plot(x,y,x,funcion(x),nod,datf,'go')
    y=[];
    case 4
        figure
        er=abs(y-funcion(x));
        dat1=zeros(size(datf));
        plot(x,er,nod,dat1,'go')
        y=[];
end



