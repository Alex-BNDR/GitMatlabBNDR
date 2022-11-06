function fi=potential(q,xq,yq,X,Y)
% Функція, що повертає значення потенціалу у вузлах координатної сітки
% q - вектор, що містить значення електричних зарядів
% xq, yq - вектори, що містять x-ві та y-ві координати електричних зарядів
% Х, Y - вектори, що містять x-ві та y-ві координати вузлів сітки
e0=8.85*10^-14; % діелектрична проникність вакууму
Nq=length(q); % число зарядів у системі
Nx=length(X); % число вузлів по осі Х
Ny=length(Y); % число вузлів по осі Y
% Прохід по кожному вузлу сітки
for i=1:Ny
    for j=1:Nx
        s=0;
% Підсумовування по зарядах
        for k=1:Nq
            s=s+q(k)/sqrt((X(j)-xq(k))^2+(Y(i)-yq(k))^2);
        end
        M(i,j)=s/(4*pi*e0);
    end
end
fi=M;
end