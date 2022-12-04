function julia()
iter = 10;
npix = 500;
% Функція, що повертає зображення множини Жюліа
% iter - число ітерацій, palitra - кольорова палітра 
% npix - число точок по кожній з осей координат (розділення)
% область
dl=1.25;
% формування лінійного масиву розміром 1хnpix з початковим і кінцевим елементами
% в точках -dl та +dl
x=linspace(-dl,+dl,npix); y=linspace(-dl,+dl,npix); 
% матриця C містить всі початкові точки даної області
[X,Y]=meshgrid(x,y); Z=X+1i*Y; C=0.27334-0.00742*1i; % початкова точка
for l=1:iter Z=Z.^2+C; end
figure(1); W = exp(-abs(Z)); imagesc(W); colormap(summer); axis ('equal','off')
figure(2); W = exp(-abs(Z)); imagesc(W); colormap(autumn); axis ('equal','off')
figure(3); W = exp(-abs(Z)); imagesc(W); colormap(spring); axis ('equal','off')
figure(4); W = exp(-abs(Z)); imagesc(W); colormap(winter); axis ('equal','off')
end