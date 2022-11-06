function z=Acc(RV,Lx,Ly,N)
% Функція, що повертає миттєві прискорення кожної частинки системи
% та миттєве значення потенціальної енергії
% RV - матриця, яку повертає функція init
% Lx - ширина МД-комірки, Ly - висота МД-комірки
% N - число частинок системи
Ep=0;
for i=1:N
 Ax(i)=0; Ay(i)=0; Pe(i)=0;
end
for i=1:N-1
 for j=i+1:N
 Dx=RV(i,1)-RV(j,1);
 % перевірка граничних умов
 if abs(Dx)>Lx/2
 Dx=Dx-sign(Dx)*Lx;
 end
 Dy=RV(i,2)-RV(j,2);
 % перевірка граничних умов
 if abs(Dy)>Ly/2
 Dy=Dy-sign(Dy)*Ly;
 end
 Ax(i)=Ax(i)+Fx(Dx,Dy); % проекція прискорення на ось оХ
 Ax(j)=Ax(j)-Fx(Dx,Dy); % третій закон Ньютона
 Ay(i)=Ay(i)+Fy(Dx,Dy); % проекція прискорення на ось оУ
 Ay(j)=Ay(j)-Fy(Dx,Dy); % третій закон Ньютона
 r=(Dx^2+Dy^2).^0.5;
 Ep=Ep+4*(1/r.^12-1/r.^6); % потенціальна енергія
 end
end
Pe(N)=Ep;
z=cat(2,Ax',Ay',Pe');
end
