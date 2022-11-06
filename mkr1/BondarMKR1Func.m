function BondarMKR1Func()
clear all
global Q1 Q2 C1x C1y C2x C2y
Q1=-50;  
C1x=5; C1y=0; C2x=0; C2y=10;
x0=0; 
y0=0; 
vx0=0; 
vy0=4.3; 
T1=4000;
x1=C1x; 
y1=C1y; 
x2=C2x; 
y2=C2y; 

figure (1)
Q2=-0.2;
tol=1e-6;
[t,h]=ode45(@pointq12,[0,T1],[x0,y0,vx0,vy0],odeset('RelTol',tol));
x=h(:,1); y=h(:,2); % я дублюю цю стрічку в кожній фігурі, щоб дані перезаписувались
plot(x,y,'b-'); % виведення траєкторії при Q2=-0.2
hold on
% виведення положення нерухомих зарядів при Q2=-0.2
plot(x1,y1,'r+',x2,y2,'r*','MarkerSize',15); 
plot(x1,y1,'ro',x2,y2,'ro','MarkerSize',15);
comet(x,y); % рух
title('Траекторія руху точкових зарядів при Q1=-50, Q2=-0.2');
xlabel('\itx'); 
ylabel("\ity");
legend("Траекторія руху","C1","C2")

figure (2)
Q2=0.2;
tol=1e-6;
[t,h]=ode45(@pointq12,[0,T1],[x0,y0,vx0,vy0],odeset('RelTol',tol));
x=h(:,1); y=h(:,2);
plot(x,y,'b-'); % виведення траєкторії при Q2=0.2
hold on
% виведення положення нерухомих зарядів при Q2=0.2
plot(x1,y1,'g+',x2,y2,'g*','MarkerSize',15); 
plot(x1,y1,'go',x2,y2,'go','MarkerSize',15);
comet(x,y);
title('Траекторія руху точкових зарядів при Q1=-50, Q2=0.2');
xlabel('\itx'); 
ylabel("\ity");
legend("Траекторія руху","C1","C2")

figure (3)
Q2=-1.5;
tol=1e-6;
[t,h]=ode45(@pointq12,[0,T1],[x0,y0,vx0,vy0],odeset('RelTol',tol));
x=h(:,1); y=h(:,2);
plot(x,y,'b-'); % виведення траєкторії при Q2=-1.5
hold on
% виведення положення нерухомих зарядів при Q2=-1.5
plot(x1,y1,'b+',x2,y2,'b*','MarkerSize',15); 
plot(x1,y1,'bo',x2,y2,'bo','MarkerSize',15);
comet(x,y);
title('Траекторія руху точкових зарядів при Q1=-50, Q2=-1.5');
xlabel('\itx'); 
ylabel("\ity");
legend("Траекторія руху","C1","C2")