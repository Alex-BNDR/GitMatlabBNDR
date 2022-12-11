function [X,Y]=Dracon1()
Lmax=7;
% Функція, що повертає зображення дракона, Lmax — порядок дракона
% породжуючі правила
Axiom='FXF--FF--FF'; Newf='F'; Newx='--FXF++FXF++FXF--'; Newy='';
teta=pi/3; alpha=pi; p=[0;0];
% звертання до функції, що повертає координати кутових точок дракона
p=CoordDragon(p,Lmax,Axiom,Newf,Newx,Newy,alpha,teta);
M=size(p,2);
X=p(1:1,1:M);% створення вектора, що містить Х-ві координати кутових точок дракона
Y=p(2:2,1:M);% створення вектора, що містить Y-ві координати кутових точок дракона
figure; plot(X,Y,'Color','b'); set(gca,'xtick',[],'ytick',[]); set(gca,'XColor','w','YColor','w');
end
