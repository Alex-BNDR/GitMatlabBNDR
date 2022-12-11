function modelIzing2(Nspin,J,h,TT,NTrial)
% Функція, що повертає миттєві значення: Es - повної енергії системи,
% Ed - енергії демона, SpM - намагніченості, Accept - середнього числа прийняття
% Nspin - число спінів системи, J - константа обмінної взаємодії
% h - зовнішнє магнітне поле, Esi - кінцева енергія системи
% NTrial - кількість випробувань задання конфігурації спінів в момент часу t=0
for i=1:length(TT)
    [Estart,Sstart,Mstart]=InitSp(Nspin,J,h);

    [E,Accept,M,S]=IsingKA(Nspin,J,h,NTrial,TT(i),Sstart,Mstart,Estart);

    j=1:length(E)-2000;
    E1(j)=E(j+2000);
    M1(j)=M(j+2000);

    E2=E1.^2;
    c(i)=(1/TT(i).^2)*(mean(E2)-mean(E1).^2)/Nspin;
    M2=M1.^2;
    x(i)=(1/TT(i))*(mean(M2)-mean(M1).^2);

end
figure(); plot(TT,c,'b'); grid; title('Залежність теплоємності від температури'); xlabel('\itT'); ylabel("\itc");
figure(); plot(TT,x,'b'); grid; title('Залежність магнітної сприйнятливості від температури'); xlabel('\itT'); ylabel("\itX");
end