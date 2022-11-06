function f=pointq12(t,x)
global Q1 Q2 C1x C1y C2x C2y
f=[x(3); x(4); 
    Q1*(x(1)-C1x)/(sqrt((x(1)-C1x)^2+(x(2)-C1y)^2))^3+Q2*(x(1)-C2x)/(sqrt((x(1)-C2x)^2+(x(2)-C2y)^2))^3;
    Q1*(x(2)-C1y)/(sqrt((x(1)-C1x)^2+(x(2)-C1y)^2))^3+Q2*(x(2)-C2y)/(sqrt((x(1)-C2x)^2+(x(2)-C2y)^2))^3];
