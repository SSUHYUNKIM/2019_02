function Xs = SquareRoot(p)
Xo = p; imax = 20;
if p < 0
    disp('Input argument cannot be negative.')
    Xs = 'Error';
else
    for i = 1:imax
        Xp = Xo - (Xo^2-p)/(2*Xo);
        if abs((Xp - Xo)/Xo) < 1E-6
            Xs = Xp;
            break
        end
        Xo = Xp;
    end
    if i == imax
        fprintf('Solution is not obtained in %i iterations.\n',imax)
        Xs = ('No answer');
    end
end