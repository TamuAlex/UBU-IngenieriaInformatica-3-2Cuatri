function dibunew(x,coef,nod,fun,opcion)
% dibuja el polinomio interpolador EN EL MÍNIMO INTERVALO que contiene a x
% y al vector nod
% x es el número en el que queremos evaluar el polinomio
% la función está en el archivo 'funcion.mth' y hay que cambiarla en cada
% caso.
% opcion toma los valores 1 , 2 y 3 dependiende de si queremos dibujar solo el
% polinomio, solo la función o ambos, respectivamente.
%
% y=dibunew(x,coef,nod,fun,opcion);

nod1=[nod,x];
m1=min(nod1);
m2=max(nod1);

x1=linspace(m1,m2);
y=zeros(1,length(x1));


for i=1:length(x1)
    y(i)=evalnewe(x1(i),coef,nod);
    
end

figure

if opcion==1
    
    plot(x1,y,'blue',nod,fun,'go')
elseif opcion==2
     plot(x1,funcion(x1),'r',nod,fun,'go')
else
     plot(x1,y,x1,funcion(x1),nod,fun,'go')
end
