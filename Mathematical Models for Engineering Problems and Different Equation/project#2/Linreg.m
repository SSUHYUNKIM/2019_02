function [a, Er] = Linreg(x,y)
p=length(x);
q=length(y);
if p~=q
    disp('���� : x�� y�� ���Ҽ��� ���ƾ��Ѵ�.');
    a(1)='x';
    a(2)='x';
    Er='error';
    elese
    a=[0 0];
    Sx = sum(x);
    Sy = sum(y);
    Sxy = sum(x.*y);
    Sxx = sum(x.*x);
    a(2)=(p*Sxy-Sx*Sy)/(p*Sxx-Sx^2);
    a(1)=(Sxx*Sy-Sxy*Sx)/(p*Sxx-Sx^2);
    Er=sum((y-(a(2).*x+a(1))).^2);
end
end
