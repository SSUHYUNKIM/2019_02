function R = BisecAllRoots(Fun,a,b,TolMax)
n = 10;
c = 1;
d = 1;
i = 0;
while c==1
    c = 0;
    h = (b - a)/n;
    i=i+1;
    if i==5 z
        break
    end
    for i=1:n
        ai=a+h*(i-1);
        bi=ai+h;
        Fai = Fun(ai);
        Fbi = Fun(bi);
        if Fai*Fbi < 0 
            xs=BisectionRoot(Fun,ai,bi);
            if n==10 && d==1
                R(d)=xs;
                d=d+1;
            else
                lr=length(R);
                e=0;
                for ka=1:lr 
                    if abs(R(ka)-xs)<TolMax
                        e=1;
                    end
                end
                if e==0
                    R(d)=xs;
                    d=d+1;
                    c=1;
                end
            end
        end
    end
    n = 10*n;
end