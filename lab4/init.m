function z=init(Lx,Ly,Nx,Ny,Vmax) 
% Функція, яка повертає початкову конфігурацію системи
% Lx - ширина МД-комірки, Ly - висота МД-комірки
% Nx - ширина початкової комірки, Ny - висота початкової комірки
% Vmах - максимальне значення швидкості
Posrow=Ly/(Ny+1); 
Poscol=Lx/(Nx+1);
N=Nx*Ny; % число частинок системи
i=1;
for Rows=1:Ny
 for Col=1:Nx
 x(i)=Poscol*Col/2; 
 y(i)=Posrow*Rows; % задання початкових координат частинок
 
 % задання початкових швидкостей частинок
 Vx(i)=Vmax*(2*rand(1)-1); 
 Vy(i)=Vmax*(2*rand(1)-1);
 i=i+1;
 end
end
Vxfull=mean(Vx); Vyfull=mean(Vy); % проекції швидкості центру мас системи
i=1:N;
Vx(i)=Vx(i)-Vxfull; Vy(i)=Vy(i)-Vyfull;
% повернення матриці, що містить початкові значення координат 
% та проекцій швидкостей частинок статистичної системи
z=cat(2,x',y',Vx',Vy');
end

