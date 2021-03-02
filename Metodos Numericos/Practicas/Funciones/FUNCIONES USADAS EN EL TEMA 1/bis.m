function sol=bis(a,b,tol)

%Este programa hace el m�todo 
%de la bisecci�n en el intervalo [a,b]. La funci�n f
%est� en el fichero f.m y hay que cambiarla en cada caso.
% El programa parar� cuando el intevalo de salida sea menor que tol.
%
% sol= bis(a,b,tol)




if (b-a)<=tol
    disp('longitud del intervalo menor que tolerancia')
    sol=[a,b];
    return
end

contador=0;
while abs(b-a)>tol
   contador=contador+1;
    c=(a+b)/2;
   
   if abs(f(c))<10^(-15)
      disp('soluci�n en el punto medio del intervalo')
       sol=c;
       return
    elseif f(a)*f(c)<0
      b=c;
   else
      a=c;
   end
end

disp('----')
disp('n�mero de iteraciones realizadas')
disp (contador)
sol=[a,b];
