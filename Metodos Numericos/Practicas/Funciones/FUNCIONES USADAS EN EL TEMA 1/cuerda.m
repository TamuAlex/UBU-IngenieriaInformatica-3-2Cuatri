function [c,yc]=cuerda(a,b,tol,opcion)
% método de la cuerda para encontrar raices de la ecuacion f=0
% la función está en el archivo f.m y ha de modificarse en cada caso.
% a y b son los extremos del intervalo
% c es la aproximación a la raiz , yc =f(c) , tol=tolerancia 
% Si opcion =1 sale la representación gráfica del método.
% Si opcion =0 no se representa nada.
% 
%
% [c,yc]=cuerda(a,b,tol,opcion)

ya=f(a);
yb=f(b);

% dibujo de los ejes

if opcion==1
figure
x=a:.001:b;
hold on
plot ([a,b],[0,0],'g')
plot(x,f(x),'r')
end

% iteración de la cuerda

for i=1:200
	c=a-ya*(b-a)/(yb-ya);
	yc=f(c);
    if opcion==1
	 plot (x,ya+((yb-ya)/(b-a))*(x-a))
    end
	if abs(yc)<tol
		
		disp('nº de iteraciones= '),disp(i)
		return
        
	end
	if sign(yc)==sign(ya)
		a=c;
		ya=yc;
			else
				b=c;
				yb=yc;
    end
    if opcion==1
	plot([c,c],[0,yc])
    end
end					
			
disp('200 iteraciones no han sido suficientes')




