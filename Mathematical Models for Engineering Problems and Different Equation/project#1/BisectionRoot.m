function Xs = BisectionRoot(Fun,a,b)
Fa = Fun(a);
Fb = Fun(b);
imax = 20;
if Fa*Fb > 0
    Xs = ('Error: points a and b are not on opposite sides of the solution');
else
    for i = 1:imax
        Xs = (a + b)/2;
        FXs=Fun(Xs);
        if FXs == 0
            break
        end
        if Fa*FXs < 0
            b = Xs;
        else
            a = Xs;
            Fa = FXs;
        end
    end
end