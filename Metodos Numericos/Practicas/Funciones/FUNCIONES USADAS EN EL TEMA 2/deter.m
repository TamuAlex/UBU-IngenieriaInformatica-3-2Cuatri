function [d,L,U]=deter(A)
% Este programa calcula el determinante de A por eliminaci�n gaussiana sin pivotaje
% L y U son las matrices de la descomposici�n LU de A
% d es el valor del determinante
% 
% 
%
% [d,L,U]=deter(A)

% Comprobaci�n de que la matriz es cuadrada 

u=size(A);
n=u(1);

 if n~=u(2)
   disp(' La matriz no es cuadrada ')
   return
 end
 
 
% Sustituci�n progresiva

for j=1:n

    
  if A(j,j)==0
   disp('Elemento diagonal nulo')
   disp('no se puede ejecutar la eliminacion gaussiana')
    return

  end 

  for i=j+1:n

    A(i,j)=A(i,j)/A(j,j);
    A(i,j+1:n)=A(i,j+1:n)-A(i,j)*A(j,j+1:n);
    
  end
end

L=tril(A);
U=triu(A);

for j=1:n
    L(j,j)=1;   
end


%Calculo del determinante

d=prod(diag(U));






