clear
n = 10;
imgSize = 2^n+1;
% Initialization
z = zeros(imgSize,imgSize);
z(1,1)  = 64*rand;
z(1,imgSize) = 64*rand;
z(imgSize,1) = 64*rand;
z(imgSize,imgSize) = 64*rand;
infLim = imgSize;
for i = n:-1:1
    delta = 2^i;
    infLim = (infLim+1)/2;
    % Compute diamond points
    for j = infLim:delta:imgSize
        for k = infLim:delta:imgSize
            z(j,k) = (z(j-delta/2,k-delta/2)+z(j-delta/2,k+delta/2)+...
                z(j+delta/2,k-delta/2)+z(j+delta/2,k+delta/2))/4+...
                delta*randn;
        end
    end
    
    % Compute square points
    for j = infLim:delta:imgSize
        for k = infLim:delta:imgSize
            if (k-delta>0)
                z(j,k-delta/2) = mean([z(j-delta/2,k-delta/2) ...
                    z(j+delta/2,k-delta/2) ...
                    z(j,k-delta) z(j,k)]) + delta*randn;
            else
                z(j,k-delta/2) = mean([z(j-delta/2,k-delta/2) ...
                    z(j+delta/2,k-delta/2) ...
                    z(j,k)]) + delta*randn;
            end
            if (k+delta<=imgSize)
                z(j,k+delta/2) = mean([z(j-delta/2,k+delta/2) ...
                    z(j+delta/2,k+delta/2) ...
                    z(j,k) z(j,k+delta)]) + delta*randn;
            else
                z(j,k+delta/2) = mean([z(j-delta/2,k+delta/2) ...
                    z(j+delta/2,k+delta/2) ...
                    z(j,k)]) + delta*randn;
            end            
            if (j-delta>0)
                z(j-delta/2,k) = mean([z(j-delta,k) z(j,k) ...
                    z(j-delta/2,k-delta/2) ...
                    z(j-delta/2,k+delta/2)]) + delta*randn;
            else
                z(j-delta/2,k) = mean([z(j,k) ...
                    z(j-delta/2,k-delta/2) ...
                    z(j-delta/2,k+delta/2)]) + delta*randn;
            end            
            if (j+delta<=imgSize)
                z(j+delta/2,k) = mean([z(j,k) z(j+delta,k) ...
                    z(j+delta/2,k-delta/2) ...
                    z(j+delta/2,k+delta/2)]) + delta*randn;
            else
                z(j+delta/2,k) = mean([z(j,k) ...
                    z(j+delta/2,k-delta/2) ...
                    z(j+delta/2,k+delta/2)]) + delta*randn;
            end
        end
    end
end
mapa = hsv;

mymap = [1 1 1  %
        1 0 0   %
        0 1 0   %
        0 0 1   %
        1 1 1]; %

figure(1), imagesc(z), colormap(mapa)
%%
% Cycle colors for 60 seconds
for i = 1:600
    pause(0.1)
    mapa(1:64,:) = [mapa(2:64,:); mapa(1,:)];
    colormap(mapa)
end