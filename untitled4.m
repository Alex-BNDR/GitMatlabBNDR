Z=[1:1000;1:1000];
for a=1:1000
    for b=1:1000
        Z(a,b)=0;
    end
end
count=1:1000;
for b=1:1000
        count(b)=0;
end



% Z(строка, столбець) = Y(1)-X(1+1)
% 
% 
% Z(2, 1) = Y(1)-X(2+1)

x=1;
y=1;

while x<=1000
    while y<=1000
        Z(y,x)=Y(x)-X(y+1);
        y=y+1;
    end
    y=1+x;
    x=x+1;
end

x=1;
y=1;

while x<=1000
    y=1;
    while y<=1000
        if Z(y,x)>=1
            count(y)=count(y)+1;
        end
        y=y+1;
    end
    x=x+1;
end

c = count';
m=max(c)
