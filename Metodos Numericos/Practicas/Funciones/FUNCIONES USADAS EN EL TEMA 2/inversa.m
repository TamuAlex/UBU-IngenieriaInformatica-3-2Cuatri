function [I,L,U]=inversa(A)
% Este programa calcula la inversa de una matriz dada A haciendo
% eliminacion Gaussiana
% L,U son las matrices de la factorizacion LU de A
% I es la inversa
%
%
%
%[I,L,U]=inversa(A)


%Comprobación de que la matriz es cuadrada y su determinante es no nulo

if size(A,1)~=size(A,2)
    disp('matriz no cuadrada')
   I=[];
   L=[];
   U=[];
    return
elseif det(A)==0
    disp('determinante nulo. Matriz no inversible')
    I=[];
    L=[];
    U=[];
    return
end

 B=eye(size(A));
[I,L,U]=elgaus1(A,B);









