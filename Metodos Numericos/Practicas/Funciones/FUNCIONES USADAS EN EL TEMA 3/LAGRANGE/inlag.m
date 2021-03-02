function coef=inlag(nod,fun)
% c�lculo del polinomio de interpolaci�n de Lagrange
% nod contiene los nodos de interpolaci�n
% fun contiene los valores de la funci�n en los nodos correspondientes
% coef da los coeficientes del polinomio en forma de Lagrange
% si se quiere interpolar distintas funciones en los mismos nodos
% es conveniente poner fun=[1 1 1 ...] y as� se obtienen los 
% coeficientes del polinomio interpolador.
%
% coef=inlag(nod,fun)
 
% verificaci�n de datos.

n=length(nod);
if n~=length(fun)
	'vectores de distinto tama�o'
	return
end

% coeficientes

for i=1:n
	A(i,i)=1;
	for j=1:i-1
		if nod(i)-nod(j)==0
			'nodos de interpolaci�n iguales'
			return
		end
	A(i,j)=nod(j)-nod(i);
	A(j,i)=-A(i,j);
	end
end
coef=prod(A);

if size(fun)~=[1,n]
fun=fun';
end

coef=(fun./coef);
