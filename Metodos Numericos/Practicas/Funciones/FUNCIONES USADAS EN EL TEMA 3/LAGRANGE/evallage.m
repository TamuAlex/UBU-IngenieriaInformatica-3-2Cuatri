function [sol,coter]=evallage(x,coef,nod,fun,M)
% function [sol,coter]=evallage(x,coef,nod,M)
% evaluación del polinomio interpolador de Lagrange.
% x punto de evaluación.
% coef coeficientes del polinomio interp. en forma de Lagrange
% (es necesario conocerlos o haber ejecutado previamente inlag)
% nod nodos de la interpolación.
% sol valor del polinomio en x.
% M es una cota conocida de la derivada de orden n+1 de f EN EL MÍNIMO
% INTERVALO QUE CONTIENE A LOS NODOS Y A x (debe calcularse aparte)
% coter da una cota del error cometido
% si no se conoce M puede usarse sol=evallage(x,coef,nod,fun)




n=length(nod);

if numel(x)~=1
	disp('el punto de interpolación no es un número')
	return
end

coter=0;

% evaluación

% Miramos si x es un nodo
for i=1:n
if x==nod(i)
    sol=fun(i);
    
    return
end
end

% evaluamos en x


x1=x*ones(1,n);
x1=x1-nod;
w=prod(x1);
w1=w*ones(1,n);

w2=w1./x1;

sol=coef*w2';
coter=[];

if nargin==5 % Cálculo del error

coter=abs(w)*M/factorial(n);

end

