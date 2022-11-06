u=dsolve('D3y=2*x', 'y(0)=1', 'Dy(0)=1', 'D2y(0)=1')
ezplot(u, [0,20]) 
axis([0 70 0 -20])
grid on
