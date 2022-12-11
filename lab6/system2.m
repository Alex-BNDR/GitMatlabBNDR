function z=system2(D,m)
n=1;
while D>=m^n n=n+1; end
    if n>1
        a=floor(D/m^(n-1))*10^(n-1); b=mod(D,m^(n-1));
        if b>=m
            b=system2(b,m);
        end
        z=a+b;
    else z=D;
    end
end