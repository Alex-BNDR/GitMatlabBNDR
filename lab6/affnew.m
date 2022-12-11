function [X,Y]=affnew(x,y,A,a)
R=[x;y]; R=A*R+a; X=R(1); Y=R(2);
end