function [x,L,U]=elgaus(A,B)
% Este programa calcula eliminación gaussiana sin pivotaje para resolver el
% sistema Ax=B.
% A es una matriz cuadrada con det(A) no nulo
% L y U son las matrices de la descomposición LU de A.
% B es un vector columna que corresponde al término independiente del sistema Ax=B 
% y es el vector columna solución del sistema Ax=B.
% 
%
% [x,L,U]=elgaus(A,B)

% Comprobación de que la matriz es cuadrada y que B es vector columna

u=size(A);
n=u(1);

 if n~=u(2)
   disp(' La matriz no es cuadrada ')
   return
 end
 
 s1=size(B);
 if s1(1)~=n
   B=B';
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
    B(i)=B(i)-A(i,j)*B(j);

  end
end

L=tril(A);
U=triu(A);


% Sustitución regresiva

x(n)=B(n)/A(n,n);
L(n,n)=1;
x=x';

for i=n-1:-1:1

  x(i)=(B(i)-A(i,i+1:n)*x(i+1:n))/A(i,i);
  L(i,i)=1;

end









