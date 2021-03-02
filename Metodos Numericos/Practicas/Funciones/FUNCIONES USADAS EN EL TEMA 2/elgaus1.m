function [X,L,U]=elgaus1(A,B)
% Este programa calcula eliminación gaussiana sin pivotaje para resolver
% VARIOS SISTEMAS con matriz de coeficientes A usando COMO DISTINTOS
% TÉRMINOS INDEPENDIENTES LAS DISTINTAS COLUMNAS DE B.
% L y U son las matrices de la descomposición LU de A.
% x es la MATRIZ CUYAS COLUMNAS SON LAS SOLUCIONES DE LOS DISTINTOS SISTEMAS AX=B.
% B puede ser una matriz cuyas columnas son los distintos terminos
% independientes, en ese caso x será una matriz cuyas columnas son las
% soluciones de cada sistema formado por la correspondiente columna de B.
%
% [X,L,U]=elgaus1(A,B)

% Comprobación de que la matriz es cuadrada

u=size(A);
n=u(1);

 if n~=u(2)
   disp(' La matriz no es cuadrada ')
   return
 end
 
 
% Sustitución progresiva

for j=1:n

   if A(j,j)==0
    disp('Elemento diagonal nulo')
    disp('no se puede ejecutar eliminacion Gaussiana sin pivotaje')
    L=[]; U=[]; x=[];
    return
   end 

  for i=j+1:n

    A(i,j)=A(i,j)/A(j,j);
    A(i,j+1:n)=A(i,j+1:n)-A(i,j)*A(j,j+1:n);
    B(i,:)=B(i,:)-A(i,j)*B(j,:);

  end
  
end

L=tril(A);
U=triu(A);

for i=1:n
    L(i,i)=1;
end
% Sustitución regresiva

for k=1:size(B,2)
    b=B(:,k);
    
  x(n)=b(n)/A(n,n);
  
  x=x';
    for i=n-1:-1:1

        x(i)=(b(i)-A(i,i+1:n)*x(i+1:n))/A(i,i);
       
    end
  X(:,k)=x;
  x=x';
end

