function N = OneNorm(A)

s = size(A, 2);
z = zeros(1, s);
Cmax = sum(abs(A(:,1)));

for i = 1:s
    z(i) = sum(abs(A(:,i)));
    
    if z(i) > Cmax
        Cmax = z(i);
    end
end

N = Cmax;
end
