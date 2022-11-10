function metMD(Nx,Ny,Lx,Ly,Vmax,Ni,dt)
% Lx - ширина МД-комірки, Ly - висота МД-комірки
% N - число частинок системи
% Ni - число МД-кроків, dt - крок інтегрування рівнянь руху
% А - масив, який повертає функція init
N=Nx*Ny;
A=init(Lx,Ly,Nx,Ny,Vmax) 
md=MD(Lx,Ly,N,Ni,dt,A)

figure(1); plot(md(:,1,1),md(:,2,1),'o','LineWidth',2); axis([0 Lx 0 Ly]);
title('Початкова конфігурація статистичної системи'); xlabel('\itx'); ylabel("\ity");
figure(2); plot(md(:,1,501),md(:,2,501),'o','LineWidth',2); axis([0 Lx 0 Ly]);
title('Конфігурація статистичної системи у момент часу t=0.05'); xlabel('\itx'); ylabel("\ity");
figure(3); plot(md(:,1,5001),md(:,2,5001),'o','LineWidth',2); axis([0 Lx 0 Ly]);
title('Конфігурація статистичної системи у момент часу t=0.5'); xlabel('\itx'); ylabel("\ity");
figure(4); plot(md(:,1,10001),md(:,2,10001),'o','LineWidth',2); axis([0 Lx 0 Ly]);
title('Конфігурація статистичної системи у момент часу t=1'); xlabel('\itx'); ylabel("\ity");

for i=1:Ni+1
    N1(i)=0;
    tmp=md(:,1,i);
    for j=1:N
        if tmp(j)<=Lx/2
            N1(i)=N1(i)+1;
        end
    end
end

for i=1:Ni+1
    Sum=0;
    tmpVx=md(:,3,i); tmpVy=md(:,4,i);
    for j=1:N
        Sum=Sum+0.5*(tmpVx(j)^2+tmpVy(j)^2);
    end
    Ek(i)=Sum; Ep(i)=md(N,7,i);
end

i=1:Ni+1; figure(5); plot((i-1)*dt,Ek/N); title('Залежність кінетичної енергії частинки від часу'); xlabel('\itt'); ylabel("\itE-kinetic");
i=1:Ni+1; figure(6); plot((i-1)*dt,Ep/N); title('Залежність потенціальної енергії частинки від часу'); xlabel('\itt'); ylabel("\itE-potential");

end
