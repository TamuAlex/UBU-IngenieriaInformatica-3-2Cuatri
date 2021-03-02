function solu=secante(x0,x1,tol)
% esta función calcula el m¡mét de La secante.
% f.m contiene la función y ha de cambiarse
% en cada caso.
% x0, x1 son los iterantes iniciales.
% TOL es la tolerancia permitida
% er es el vector que calcula las diferencias entre dos iterantes consecutivos
% err es el vector de errores relativos
% Considero que si 100 iteraciones no son suficientes el método
% no es bueno
% solu es una matriz que contiene la solución,  el error absoluto y el
% relativo.
% 
%
% solu=secante(x0,x1,tol)

% iteración

sol(1)=x0;
sol(2)=x1;
er(1)=0;
er(2)=0;

for i=2:100
    derivada=(f(sol(i))-f(sol(i-1)))/(sol(i)-sol(i-1));
	sol(i+1)=sol(i)-(f(sol(i))./derivada);
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


solu=[sol er err];
