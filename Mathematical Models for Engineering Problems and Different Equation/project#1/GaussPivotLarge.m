function x = GaussPivotLarge(a,b)
ab = [a,b];
[R,C] = size(ab);
for j = 1:R-1
    for k =j+1:R
        if abs(ab(k,j))>abs(ab(j,j))
            abTemp = ab(j,:);
            ab(j,:) = ab(k,:);
            ab(k,:) = abTemp;
            break
        end
    end
    for i = j+1:R
        ab(i,j:C) = ab(i,j:C)- ab(i,j)/ab(j,j)*ab(j,j:C);
    end
end
x = zeros(R,1);
x(R) = ab(R,C)/ab(R,R);
for i = R - 1:-1:1
    x(i) = (ab(i,C) - ab(i,i+1:R)*x(i+1:R))/ab(i,i);
end

