function y=gausei(A,B,x,tol)
% resolución de sistemas lineales por Gauss-Seidel
% A matriz del sistema
% B término independiente
% x iterante inicial
% tol tolerancia
%
% y=gausei(A,B,x,tol)


% verificación de datos

[m,n]=size(A);
 
 if m~=n
   disp('matriz no cuadrada')
   return
 end

for i=1:m

  if A(i,i)==0
  disp('elementos diagonales nulos')
  return
  end

end

s1=size(x);
if s1(1)~=n
   x=x';
end

   y=x;

% iteración

for k=1:100
   
        y(1)=(B(1)-A(1,2:n)*x(2:n))/A(1,1);
   
       

   for i=2:n-1

	y(i)=(B(i)-A(i,1:i-1)*y(1:i-1)-A(i,i+1:n)*x(i+1:n))/A(i,i);
	
    end

	y(n)=(B(n)-A(n,1:n-1)*y(1:n-1))/A(n,n);


    if max(abs(y-x))<tol
	disp('nº de iteraciones'),disp(k)
	 return
    end 
 
    x=y;

end	

disp('100 iteraciones no han sido suficientes')
disp('solucion no válida')

		