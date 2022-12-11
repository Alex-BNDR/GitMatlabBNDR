function RIFSclip()

Niter = 6; NTrial = 50000;

figure;
i=5;
while i<=NTrial
    Cristal3(i);
    pause(0.3);
    i=i*5;
end
title('derevo');
end