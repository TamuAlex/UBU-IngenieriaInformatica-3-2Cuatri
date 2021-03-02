function y=suma(n)


if n<=0
    y=[];
    return
end

%Con esto nos garantizamos de que el numero sea entero
if floor(n)~=n
    return
end

y=0;
for i=1:n
    y=y+i;
    
end