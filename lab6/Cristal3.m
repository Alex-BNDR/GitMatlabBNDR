function z=Cristal3()

Niter = 6; NTrial = 50000;

x1=0; y1=0; x2=1; y2=0; x3=1/2; y3=sin(pi/3); j=1; Flag=0;
while Flag==0
    tmpx=rand(1,1); tmpy=sqrt(3)/2*rand(1,1);
    if(-sqrt(3)*tmpx+tmpy<=0)&&(sqrt(3)*tmpx+tmpy-sqrt(3)<=0)
        x=tmpx; y=tmpy; Flag=1;
    end
end
k=1;
for m=1:Niter
    for i=1:4^m 
        Tmp(k)=system2(i-1,4); 
        k=k+1; 
    end
end
Q(1)=4;
for m=2:Niter 
    Q(m)=Q(m-1)+4^m; 
end
n=1; s='0'; M=1;
while n<=length(Tmp)
    m=1;
    while n>Q(m) 
        m=m+1; 
    end
    if m==1
        S(n,1:1)=s;
    else
        S(n,1:1)=s;
        for i=2:m 
            S(n,1:i)=strcat(S(n,:),s); 
        end
    end
    n=n+1;
end
for i=1:k-1
    tmp=num2str(Tmp(i)); m=1;
    while i>Q(m) 
        m=m+1; 
    end
    tmp1(1:m)=S(i,1:m);
    for m=1:length(tmp)
        tmp1(length(tmp1)-m+1:length(tmp1)-m+1)=tmp(length(tmp)-m+1:length(tmp)-m+1);
    end
    Cod(i,1:length(tmp1))=tmp1;
end
A1=[0.1950, -0.4880; 0.3440, 0.4430]; 
A2=[0.4620, 0.4140; -0.2520, 0.3610];
A3=[-0.0580, -0.0700; 0.4530, -0.1110]; 
A4=[-0.0350, 0.0700; -0.4690, 0.0220];
A5=[-0.6370, 0.0000; 0.0000, 0.5010];

a1=[0.4431; 0.2452]; 
a2=[0.2511; 0.5692]; 
a3=[0.5976; 0.0969]; 
a4=[0.4884; 0.5069]; 
a5 = [0.8562; 0.2513];

figure; hold on;
set(gca,'xtick',[],'ytick',[]); 
set(gca,'XColor','w','YColor','w');
DrawFractal(NTrial,x,y,A1,A2,A3,A4,A5,a1,a2,a3,a4,a5,Cod); 
hold off

end