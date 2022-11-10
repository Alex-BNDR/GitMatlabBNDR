function [E,Accept,M,S]=IsingKA(Nspin,J,h,NTrial,T,Sstart,Mstart,Estart)
% Функція, що повертає: Е - миттєві значення енергії системи, 
% Accept - число прийняття, М - миттєвий магнітний момент системи, 
% S - миттєві конфігурації спінів системи, Nspin - число спінів системи, 
% J - константа обмінної взаємодії, h - напруженість зовнішнього магнітного поля,
% NTrial - число випробувань, T - температура системи, 
% Sstart - матриця, що містить інформацію про орієнтацію спінів у момент часу t=0
% Mstart - значення магнітного моменту системи у момент часу t=0
% Estart - енергія системи в момент часу t = 0
Ns=Nspin.^0.5; M(1)=Mstart; S=Sstart; E(1)=Estart; s=Sstart; Accept=0; k=2;
for i=1:NTrial
    for j=1:Nspin % випадковий вибір номера вузла для перекидання спіна
        Ix=floor(Ns*rand(1)+1); Iy=floor(Ns*rand(1)+1);
         % перевірка періодичних граничних умов
        if Ix==1
            Left=Ns;
        else
            Left=Ix-1;
        end
        if Ix==Ns
            Right=1;
        else
            Right=Ix+1;
        end
        if Iy==Ns
            Up=1;
        else
            Up=Iy+1;
        end
        if Iy==1
            Down=Ns;
        else
            Down=Iy-1;
        end
        % пробний перекид спіна
        Temp=s(Iy,Ix); s(Iy,Ix)=-s(Iy,Ix); 
        de=2*s(Iy,Ix)*(h+J*(s(Iy,Left)+s(Iy,Right)+s(Down,Ix)+s(Up,Ix)));
        if or(de<=0,rand(1)<=exp(-de./T)) % пробний перекид спіна приймається
            Accept=Accept+1; E(k)=E(k-1)-de; M(k)=M(k-1)+2*s(Iy,Ix);
        else % пробний перекид спіна не приймається
            s(Iy,Ix)=Temp; E(k)=E(k-1); M(k)=M(k-1);
        end
        S=cat(3,S,s); k=k+1;
    end
end
Accept=Accept/(NTrial*Nspin); % середнє число прийняття
end