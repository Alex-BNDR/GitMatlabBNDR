function z=DrawFractal(NTrial,x,y,A1,A2,A3,A4, A5,a1,a2,a3,a4, a5,Cod)
X1=zeros(NTrial,1); Y1=zeros(NTrial,1); X=x; Y=y;
for m=1:NTrial
Np=1+round((size(Cod,1)-1)*rand(1,1)); Rule=Cod(Np,:);
for i=1:length(Rule)
tmp=Rule(length(Rule)+1-i);
if tmp=='0' [X Y]=affnew(X,Y,A1,a1); end
if tmp=='1' [X Y]=affnew(X,Y,A2,a2); end
if tmp=='2' [X Y]=affnew(X,Y,A3,a3); end
if tmp=='3' [X Y]=affnew(X,Y,A4,a4); end
if tmp=='4' [X Y]=affnew(X,Y,A5,a5); end
end
X1(m)=X; Y1(m)=Y;
end
plot(X1,Y1,'.','MarkerSize',1,'MarkerEdgeColor','k');
end


