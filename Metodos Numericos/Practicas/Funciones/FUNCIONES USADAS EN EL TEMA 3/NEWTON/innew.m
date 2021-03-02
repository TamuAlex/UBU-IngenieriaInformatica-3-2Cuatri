function coef=innew(nod,fun)
% polinomio de interpolación forma Newton
% nod nodos de interpolación
% fun valores de la función en los nodos.
% coef coeficientes del polinomio en forma de Newton.
%
% coef=innew(nod,fun)

n=length(nod);
if n~=length(fun)
	disp('vectores de diferente longitud')
	return
end

if size(nod)~=[n,1]
nod=nod';
end

if size(fun)~=[n,1]
fun=fun';
end

% coeficientes

a(:,1)=fun;

for i=2:n
a(i:n,i)=(a(i:n,i-1)-a(i-1:n-1,i-1))./(nod(i:n)-nod(1:n+1-i));
coef(i)=a(i,i);
end

coef(1)=fun(1);


