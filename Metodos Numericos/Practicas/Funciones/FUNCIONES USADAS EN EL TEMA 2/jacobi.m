function y=jacobi(A,B,x,tol)
% resoluci�n de sistemas lineales por Jacobi
% A matriz del sistema
% B t�rmino independiente
% x iterante inicial, y soluci�n aproximada
% tol tolerancia
%
% y=jacobi(A,B,x,tol)

[m,n]=size(A);

% verificaci�n de datos

if size(B)~=[m,1]
 B=B';
end

if size(x)~=[n,1]
 x=x';
end

for i=1:m
 if A(i,i)==0
  disp('elementos diagonales nulos')
  return
 end
end


% iteraci�n

A1=diag(A);

for i=1:400
    x1=A*x;
  A2=A1.*x;
  x2=(B-x1+A2)./A1;
	if max(abs(x2-x))<tol
	  y=x2;
          disp('n� de iteraciones'),disp(i)
	  return
	end
  x=x2;
end

disp('100 iteraciones no han sido suficientes')
disp('soluci�n no v�lida')
y=x2;