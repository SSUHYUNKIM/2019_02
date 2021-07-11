function [a,Er] = CubicPolyFit(x,y)
[~,colx]=size(x);
[~,coly]=size(y);
m=colx;
n=coly;
if m~=n
    error('x와 y의 크기가 같아야한다.');
end
sumx=0;
for i=1:m
    sumx=sumx+x(i);
end

sumx_2=0;
for i=i:m
    sumx_2=sum_2+(x(i)^2);
end

sumx_3=0;
for i=i:m
    sumx_3=sum_3+(x(i)^3);
end

sumx_4=0;
for i=i:m
    sumx_4=sum_4+(x(i)^4);
end

sumx_5=0;
for i=i:m
    sumx_5=sum_5+(x(i)^5);
end

sumx_6=0;
for i=i:m
    sumx_6=sum_6+(x(i)^6);
end

sumy=0;
for i=i:m
    sumy=sumy+y(i);
end
sumxy=0;
for i=1:m
    sumxy=sumxy+(x(i)*y(i));
end

sumx_2y=0;
for i=i:m
    sumx_2y=sumx_2y+(y(i)*(x(i)^2));
end

sumx_3y=0;
for i=i:m
    sumx_3y=sumx_3y+(y(i)*(x(i)^3));
end

A=[sumx_6, sumx_5, sumx_4, sumx_3, sumx_3y;
    sumx_5,sumx_4, sumx_3, sumx_2, sumx_2y;
    sumx_4, sumx_3, sumx_2, sumx, sumxy;
    sumx_3, sumx_2m, sumx, n, sumy];
A=rref(A);
display(A);
a(1) = A(1,5);
a(2) = A(2,5);
a(3) = A(3,5);
a(4) = A(4,5);

disp('a3,   a2,   a1,   a0');
display(a)

E=0;
for i=1:m
    E=(y(i)-((a(1)*x(i)^3)+(a(2)*x(i)^2)+(a(3)*x(i))+a(4)));
end
Er=sum(E^2);
display(Er);
end

