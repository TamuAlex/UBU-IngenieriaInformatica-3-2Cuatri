function sol=bis(a,b,tol)

%Este programa hace el método 
%de la bisección en el intervalo [a,b]. La función f
%está en el fichero f.m y hay que cambiarla en cada caso.
% El programa parará cuando el intevalo de salida sea menor que tol.
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
      disp('solución en el punto medio del intervalo')
       sol=c;
       return
    elseif f(a)*f(c)<0
      b=c;
   else
      a=c;
   end
end

disp('----')
disp('número de iteraciones realizadas')
disp (contador)
sol=[a,b];
