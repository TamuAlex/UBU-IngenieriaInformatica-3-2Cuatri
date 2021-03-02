function [j,k]=prueba(x,y,z)

if (x<0 && y<0 && z<0)
    j=x+y+z;
    k=abs(x*y*z);
    return
end

if (x==0 || y==0 || z==0)
    j=0;
    k=[1,2];
    return
end

j=x*y*z;
k=abs(x-y);
return