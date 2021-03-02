function [solu,sol1,sol2]=punfij(x0,tol,opcion)

% esta función calcula iteración del punto fijo.
% la función g(x) está en el fichero g.m y ha de cambiarse en cada caso.
% x0 es el iterante inicial
% tol es la tolerancia permitida (distancia entre 2 iterantes consecutivos)
% er es el vector que calcula las diferencias entre dos iterantes consecutivos
% err es el vector de errores relativos (cocientes en/en+1).
% Considero que si 100 iteraciones no son suficientes el método
% no converge y lo corto
% solu es una matriz que contiene la solución,  el error absoluto y el
% relativo.
% Los vectores (sol1,sol2) sirven para dibujar la iteración hecha.
% Si opcion=0 no dibuja la iteración (en ese caso basta con  ejecutar solu=punfij(x0,tol,0), 
% si opcion=1 sí la dibuja
%
% function [solu,sol1,sol2]=punfij(x0,tol,opcion)

% iteración

sol(1)=x0;
er(1)=0;
for i=1:1000
	sol(i+1)=g(sol(i));
	er(i)=abs(sol(i+1)-sol(i));
	if er(i)<tol
	disp('diferencia menor que tolerancia')
	disp('nº de iteraciones realizadas= '),disp(i)
	break
	end
end

if i==1000
	disp('1000 iteraciones no han sido suficientes')
end


% errores

er=[0,er];
sol=sol';
s=length(er);
er=er';
err=[0;0;er(3:s,:)./er(2:s-1,:)];

% vectores de dibujo

for j=1:i
sol1(2*j-1)=sol(j);
sol1(2*j)=sol(j+1);
end

sol1=sol1';
sol2=[sol1(2:length(sol1),:);sol(i+1)];

solu=[sol er err];

%dibujo de la iteracion


if opcion==1
m1=min(solu(:,1));
m2=max(solu(:,1));
x=linspace(m1,m2);
plot(x,g(x),sol1,sol2,x,x)
end




