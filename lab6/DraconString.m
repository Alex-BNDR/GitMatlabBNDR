function z=DraconString(Lmax,Axiom,Newf,Newx,Newy,n,tmp)
% Функція, що повертає L-систему
if n<=Lmax
 if n==1 tmp=Axiom; 
 end
 M=length(tmp); tmp1=' ';
 for i=1:M
 if tmp(i)=='F' tmp1=strcat(tmp1,Newf); 
 end
 if tmp(i)=='X' tmp1=strcat(tmp1,Newx); 
 end
 if tmp(i)=='Y' tmp1=strcat(tmp1,Newy); 
 end
 if not(tmp(i)=='F') &&not(tmp(i)=='X') &&not(tmp(i)=='Y')
 tmp1=strcat(tmp1,tmp(i)); 
 end
 end
 tmp=tmp1; n=n+1; tmp=DraconString(Lmax,Axiom,Newf,Newx,Newy,n,tmp);
end
z=tmp;
end
