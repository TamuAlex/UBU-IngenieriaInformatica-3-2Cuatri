function Errorlag(x,coef,nod,fun)
% dibuja el error entre el polinomio y la función si ésta es conocida.
% todos los valores como en la función dibulag.
% la función está en el archivo 'funcion.mth' y hay que cambiarla en cada
% caso.
% 
%
%y=Errorlag(x,coef,nod,fun);


nod1=[nod,x];
m1=min(nod1);
m2=max(nod1);
x1=linspace(m1,m2);
nod0=zeros(1,length(nod));
y=zeros(1,length(x1));


for i=1:length(x1)
    y(i)=evallage(x1(i),coef,nod,fun);
end

y3=funcion(x1);
er=abs(y-y3);

figure
plot(x1,er,nod,nod0,'go')

