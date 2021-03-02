function solu=new(x0,tol,opcion)
% esta función calcula iteración del mét de Newton.
% funnew.m contiene la función y dfunnew.m la derivada y han de cambiarse
% en cada caso.
% x0 es el iterante inicial
% tol es la tolerancia permitida
% er es el vector que calcula las diferencias entre dos iterantes consecutivos
% err es el vector de errores relativos
% Considero que si 100 iteraciones no son suficientes el método
% no es bueno
% solu es una matriz que contiene la solución,  el error absoluto y el
% relativo.
% Si opcion=1 El programa dibuja la iteración de Newton, si opcion=0 no la
% dibuja.
%
% solu=new(x0,tol,opcion)

% iteración

sol(1)=x0;
er(1)=0;
for i=1:100
	sol(i+1)=sol(i)-(funnew(sol(i))./dfunnew(sol(i)));
	er(i+1)=abs(sol(i+1)-sol(i));
	if er(i+1)<tol
	disp('diferencia menor que tolerancia')
	disp('nº de iteraciones realizadas= '),disp(i)
	break
	end
end

if i==100
	disp('100 iteraciones no han sido suficientes')
end

% errores

er(i+1)=abs(sol(i+1)-sol(i));
sol=sol';
s=length(er);
er=er';
err=[0;0;er(3:s,:)./er(2:s-1,:)];

if opcion==1

% dibujo de la iteración de Newton

a=min(sol)-1;
b=max(sol)+1;
x=linspace(a,b);

figure
plot(x,funnew(x))
hold on
plot([a,b],[0,0])

colores=['m','g'];

for j=1:2
plot(x,funnew(sol(j))+dfunnew(sol(j)).*(x-sol(j)),colores(j))
end
end

solu=[sol er err];
