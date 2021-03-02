function [sol,coter]=evalnewe(x,coef,nod,M)
% evaluación polinomio interpolador en forma Newton
% x punto de evaluación
% coef coeficientes polinomio 
% nodos nodos de la interpolación
% sol valor del polinomio en x
% er es el error en la forma de Newton.
% M es una cota de la derivada de orden n+1, si no se conoce usar la
% funcion de la forma sol=evalnewe(x,coef,nod)
%
% [sol,coter]=evalnewe(x,coef,nod,M)

% verificación de datos



if length(x)~=1
disp('punto no válido')
return
end

n=length(nod);
if n~=length(coef)
	disp('vectores de distinta longitud')
return
end

if size(coef)~=[n,1]
coef=coef';
end
if size(nod)~=[n,1]
nod=nod';
end

% evaluación

nod(1)=x-nod(1);
for i=2:n
nod(i)=nod(i-1)*(x-nod(i));
end
w=[1;nod(1:n-1)];
w=coef.*w;
sol=sum(w);
coter=[];

if nargin==4 % cota del error

n1=1:n;
n2=prod(n1);
coter=abs(nod(n))*M/n2;
end

end