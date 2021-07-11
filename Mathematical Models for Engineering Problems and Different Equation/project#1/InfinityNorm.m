function N = InfinityNorm(A)

s = size(A, 1);
z = zeros(s, 1);
Rmax = sum(abs(A(1,:)));

for i = 1:s
    z(i) = sum(abs(A(i,:)));
    
    if z(i) > Rmax
        Rmax = z(i);
    end
end

N = Rmax;
end