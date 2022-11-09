function [Es Ed SpM Accept]=Ising(Nspin,J,h,Esi,NTrial)
% Функція, що повертає миттєві значення: Es - повної енергії системи,
% Ed - енергії демона, SpM - намагніченості, Accept - середнього числа прийняття
% Nspin - число спінів системи, J - константа обмінної взаємодії
% h - зовнішнє магнітне поле, Esi - кінцева енергія системи
% NTrial - кількість випробувань задання конфігурації спінів в момент часу t=0
for i=1:Nspin
    s(i)=1;
end
M=Nspin; Ensys=-(J+h)*Nspin; Edemon=2*J*ceil((Esi-Ensys)/(2*J));
Es(1)=Ensys; % енергія системи в момент часу t=0
Ed(1)=Edemon; % енергія демона в момент часу t=0
SpM(1)=M; % магнітний момент системи в момент часу t=0
Accept=0; k=1;
% реалізація методу мікроканонічного ансамбля
for i=1:NTrial
    for j=1:Nspin
        Ispin=floor(Nspin*rand(1)+1); % випадковий вибір номеру спіна
        % періодичні граничні умови
        if Ispin==1 
            Left=s(Nspin);
        else Left=s(Ispin-1);
        end
        if Ispin==Nspin 
            Right=s(1);
        else Right=s(Ispin+1);
        end
        de=2*s(Ispin)*(-h+J*(Left+Right)); % пробна зміна енергії спіна
        if de<=Edemon % прийняття пробної зміни
            s(Ispin)=-s(Ispin); Accept=Accept+1;
            Edemon=Edemon-de; Ensys=Ensys+de;
        end
        k=k+1; Es(k)=Ensys; Ed(k)=Edemon; SpM(k)=sum(s);
    end
end
Accept=Accept/(NTrial*Nspin);
end