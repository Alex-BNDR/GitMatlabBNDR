clearvars;
Nx=5;
Ny=5;
Lx=8;
Ly=8;

Vmax=0.2;
dt=10^(-4);
Ni=10^4;


N=Nx*Ny;

Posrow=Ly/(Ny+1); Poscol=Lx/(Nx+1);
i=1;
for Rows=1:Ny
    for Col=1:Nx
        x(i)=Poscol*Col/2; 
        y(i)=Posrow*Rows; 
        Vx(i)=Vmax*(2*rand(1)-1); 
        Vy(i)=Vmax*(2*rand(1)-1);
        i=i+1;
    end
end
plot(x,y, '*')

T=0;
T1=0.05;
T2=0.5;
T3=1.0;


RV=init(Lx,Ly,Nx,Ny,Vmax,T) 
accfunc=Acc(RV,Lx,Ly,N)
z1=Fx(x,y)
z2=Fy(x,y)

% verletfunc=Verlet(RV,Lx,Ly,N,dt)

md=MD(Lx,Ly,N,Ni,dt,RV)



RV1=init(Lx,Ly,Nx,Ny,Vmax,T1) 
accfunc1=Acc(RV1,Lx,Ly,N)
md1=MD(Lx,Ly,N,Ni,dt,RV1)

RV2=init(Lx,Ly,Nx,Ny,Vmax,T1) 
accfunc2=Acc(RV2,Lx,Ly,N)
md2=MD(Lx,Ly,N,Ni,dt,RV2)

RV3=init(Lx,Ly,Nx,Ny,Vmax,T1) 
accfunc3=Acc(RV3,Lx,Ly,N)
md3=MD(Lx,Ly,N,Ni,dt,RV3)




% розрахунок енергій
Ep=0;
for i=1:N-1
    for j=i+1:N
        Dx=x(i)-x(j);
        if abs(Dx)>Lx/2
            Dx=Dx-sign(Dx)*Lx;
        end
        Dy=y(i)-y(j);
        if abs(Dy)>Ly/2
            Dy=Dy-sign(Dy)*Ly;
        end
        r=(Dx^2+Dy^2).^0.5; Ep=Ep+4*(1/r.^12-1/r.^6);
    end
end
Ek=0;
for i=1:N
    Ek=Ek+0.5*(Vx(i)^2+Vy(i)^2);
end
Ep
Ek
Esum = Ep+Ek 