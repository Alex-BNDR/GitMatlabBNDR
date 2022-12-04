function z=RuleKoch(Lmax,Axiom,Newf,n,tmp)
% Функція, що повертає L-систему 
% Вхідні параметри: Lmax - порядок сніжинки, Axiom - рядок, що містить аксіому,
% Newf - рядок, що містить породжуюче правило, tmp - вхідна L-система
while n<=Lmax
 if n==1
 tmp=Axiom; n=n+1;
 else
 tmp=strrep(tmp,'F',Newf); % заміна всіх букв F на породжуюче правило
 n=n+1; tmp=RuleKoch (Lmax,Axiom,Newf,n,tmp) ; % рекурсія
 end
end
z=tmp;
end