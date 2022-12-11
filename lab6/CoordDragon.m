function z=CoordDragon(p,Lmax,Axiom,Newf,Newx,Newy,alpha,teta)
% Функція, що повертає координати кутових точок дракона
Rule=DraconString(Lmax,Axiom,Newf,Newx,Newy,1,' '); % задання L-системи
M=length(Rule);
for i=1:M
 Tmp=p(1:2,size(p,2):size(p,2));
 if Rule(i)=='F' % крок вперед
 R=[cos(alpha);sin(alpha)]; R=R/(2^Lmax); Tmp=Tmp+R; p=cat(2,p,Tmp);
 end
 if Rule(i)=='+' % збільшення кута, що задає напрям руху
 alpha=alpha+teta; 
 end
 if Rule(i)=='-' % зменшення кута, що задає напрям руху
 alpha=alpha-teta; 
 end
end
z=p;
end
