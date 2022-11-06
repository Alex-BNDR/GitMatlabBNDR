function BondarLab2
% Коливання ланцюжка зв'язаних гармонічних осциляторів: вільні коливання
N=3; % кількість тіл коливальної системи
m=[1 1 1]; % маси тіл коливальної системи
k=[1 0.2 0.2 0.2]; % жорсткості пружин коливальної системи, тобто k=[1 1 1 1]
R0=[0.5 0.5 0.5]; % зміщення тіл в момент часу t=0
v0=[0 0 0]; % швидкості тіл в момент часу t=0
% Обчислення елементів матриці

for alfa=1:N+1
    for beta=1:N
        omega(alfa,beta)=k(alfa)/m(beta);
    end
end
i=1:N; j=1:N;
% Обчислення елементів матриці OMEGA згідно з (2.8)
OMEGA(1:N,1:N)=0;
for i=1:N
    if i==1
        OMEGA(i,i)=omega(1,1)+omega(2,1); 
        OMEGA(1,2)=-omega(2,1);
    end
    if i>1
        if i<N
            OMEGA(i,i-1)=-omega(i,i); 
            OMEGA(i,i)=omega(i,i)+omega(i+1,i);
            OMEGA(i,i+1)=-omega(i+1,i);
        else
            OMEGA(i,i-1)=-omega(i,i);
            OMEGA(i,i)=omega(i,i)+omega(i+1,i);
        end
    end
end 
% обчислення власних значень і власних векторів матриці OMEGA
[Sigma,Teta]=eig(OMEGA);
% Обчислення власних частот
Teta=Teta^0.5; 
for i=1:N
    for j=1:N
        SigmaV(j,i)=-Teta(i,i)*Sigma(j,i);
    end
end
C1=Sigma^-1*R0'; % розв'язання системи рівнянь (2.18)
C2=SigmaV^-1*v0'; % розв'язання системи рівнянь (2.19)
C=(C1.^2+C2.^2).^0.5; % обчислення координат вектору С
clear alfa
% Обчислення фази нормальних коливань згідно з (2.21), (2.22)
for i=1:N
    if C(i)==0
        alfa(i)=0; 
    else
        alfa(i)=atan(C2(i)./C1(i));
        if C1(i)<0
            alfa(i)=pi+alfa(i); 
        end
        if C1(i)>0
            if C2(i)<0
                alfa(i)=2*pi+alfa(i); 
            end
        end
    end
end
N=length(OMEGA);
N1=2^13; % кількість вузлів часової сітки
j=1:N1;
Tmax=80; % права границя часового інтервалу
t(j)=(j-1)/(N1-1)*Tmax; % координати вузлів часової сітки
% Обчислення значень координат тіл у вузлах часової сітки
for j=1:N1
    s=zeros(N,1);
    for i=1:N
        s=s+C(i)*Sigma(:,i).*cos(Teta(i,i)*t(j)+alfa(i));
    end
    X(:,j)=s;
end
% Обчислення значень швидкостей тіл у вузлах часової сітки
for j=1:N1
    s=zeros(N,1);
    for i=1:N
        s=s+C(i)*Sigma(:,i).*Teta(i,i)*sin(Teta(i,i)*t(j)+alfa(i));
    end
    Xv(:,j)=-s;
end


% Візуалізація залежностей миттєвих значень зміщень Х та швидкості Xv від часу
figure(1); plot(t,X(1,:),'-k',t,X(2,:),'--r',t,X(3,:),':b','LineWidth',2);
title('Візуалізація залежностей миттєвих значень зміщень Х від часу'); xlabel('\itt'); ylabel("\itX"); legend("m1","m2","m3");
figure(2); plot(t,Xv(1,:),'-k',t,Xv(2,:),'--r',t,Xv(3,:),':b','LineWidth',2);
title('Візуалізація залежностей миттєвих значень зміщень Хv від часу'); xlabel('\itt'); ylabel("\itXv"); legend("m1","m2","m3");
% Побудова траєкторії руху тіл на фазовій площині
figure(3); plot(X(1,:),Xv(1,:),'k');
title('Траєкторія руху тіла m1 на фазовій площині'); xlabel('\itX'); ylabel("\itXv");
figure(4); plot(X(2,:),Xv(2,:),'r');
title('Траєкторія руху тіла m2 на фазовій площині'); xlabel('\itX'); ylabel("\itXv");
figure(5); plot(X(3,:),Xv(3,:),'b');
title('Траєкторія руху тіла m3 на фазовій площині'); xlabel('\itX'); ylabel("\itXv");
% Обчислення спектрів залежностей зміщень тіл системи від часу
c1=fft(X(1,:)); c2=fft(X(2,:)); c3=fft(X(3,:));
j=2:N1/2;
% Обчислення спектральної щільності зміщень тіл 
Cm1(j-1)=abs(c1(j-1))/(N1/2); 
Cm2(j-1)=abs(c2(j-1))/(N1/2); 
Cm3(j-1)=abs(c3(j-1))/(N1/2);
Freq(j-1)=(j-1)/Tmax; %обчислення частот спектральних гармонік
% Візуалізація спектральних щільностей зміщень тіл
figure(6); 
semilogy(Freq,50*Cm1,'-k',Freq,400*Cm2,'--r',Freq,5000*Cm3,':b','LineWidth',2);
axis([0 2.5 10^-3 2000]);
title('Візуалізація спектральних щільностей зміщень тіл'); xlabel('\itt'); ylabel("\itSpectral Density (C)"); legend("m1","m2","m3");
end