clearvars

% Виведення графіка розв'язку і похідної
u0=[1;1;1];
[x,u]=ode45(@oscil,[0 20],u0);
figure
plot(x,u(:,1),'r'); 
grid on
hold on
plot(x,u(:,2),'b-'); 
title('Розвsязок ДР');
hold on
plot(x,u(:,3),'k-'); 
xlabel('\itx'); 
ylabel("y, y', y''");
hold on

syms y(x)
dy = diff(y,x);
d2y = diff(y,x,2);
d3y = diff(y,x,3) == 2*x;
cond = [y(0) == 1, dy(0) == 1, d2y(0) == 1];
Solv=dsolve(d3y,cond);
fplot(Solv,[0 20],'g*');

legend("Наближений розв'язок","Перша похідна","Друга похідна","Аналітичний розв'язок", Location="west")

function f=oscil(x,u)
f=[u(2); u(3); 2*x];
end

% Аналітичний розв'язок
% s(2) = subplot(2,2,2);
% syms y(x)
% dy = diff(y,x);
% d2y = diff(y,x,2);
% d3y = diff(y,x,3) == 2*x;
% cond = [y(0) == 1, dy(0) == 1, d2y(0) == 1];
% Solv=dsolve(d3y,cond);
% fplot(Solv,[0 20],'b');
% title(s(2), 'Аналітичний розвязок');
% xlabel('\itx'); 
% ylabel('{\ity}');
% hold on
% grid on


% Побудова фазового портрету
% s(3) = subplot(2,2,3);
% options=odeset('OutputFcn', @odephas2,'MaxStep',0.1);
% [x,u]=ode45(@oscil, [0 12], u0, options);
% hold on
% grid on
% plot(u(:,1),u(:,2),'k');
% title(s(3), 'Фазовий портрет');
% legend('odephas2','plot');
% xlabel('\itx'); 
% ylabel('{\ity}');
% 
