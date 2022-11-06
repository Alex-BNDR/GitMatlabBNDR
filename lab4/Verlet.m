function z=Verlet(RV,Lx,Ly,N,dt)
% Функція, що повертає значення координат, складових швидкості та
% прискорень частинок уздовж відповідних координатних осей
% RV - матриця, яку повертає функція init
% Lx - ширина МД-комірки, Ly - висота МД-комірки
% N - число частинок системи, dt - величина МД-кроку (крок інтегрування)
for i=1:N
 % нове положення частинки
 x(i)=RV(i,1)+RV(i,3)*dt+RV(i,5)*(dt^2)/2; 
 y(i)=RV(i,2)+RV(i,4)*dt+RV(i,6)*(dt^2)/2;
 % переміщення (за необхідності) частинки у центральну комірку
 if x(i)<0
 x(i)=x(i)+Lx;
 end
 if x(i)>Lx
 x(i)=x(i)-Lx;
 end
 if y(i)<0
 y(i)=y(i)+Ly;
 end
 if y(i)>Ly
 y(i)=y(i)-Ly;
 end
end
plot(x,y, '*')
% зміна швидкості з використанням «старого» прискорення
for i=1:N
 Vx(i)=RV(i,3)+0.5*RV(i,5)*dt; 
 Vy(i)=RV(i,4)+0.5*RV(i,6)*dt;
end
% обчислення «нового» прискорення
RVnew=cat(2,x',y',Vx',Vy'); 
Accnew=Acc(RVnew,Lx,Ly,N);
% обчислення швидкості з використанням «нового» прискорення
for i=1:N
 Vx(i)=Vx(i)+0.5*Accnew(i,1)*dt; 
 Vy(i)=Vy(i)+0.5*Accnew(i,2)*dt;
end
z=cat(2,x',y',Vx',Vy',Accnew);
end