function Newton_fractal4()

n=9;
maxIteration = 200;
minRe = -1;
maxRe = 1;
minIm = -1;
maxIm = 1;
xResolution = 500;
yResolution = 500;

eps = 10e-5;
Roots=exp((0:(n-1))*(2*pi)*1i/n);
Image = zeros(yResolution,xResolution,3);
dRe=(maxRe-minRe)/(xResolution-1);
dIm=(maxRe-minRe)/(yResolution-1);

for i=1:yResolution
    for j=1:xResolution
        z=minRe+(j-1)*dRe+(minIm+(i-1)*dIm)*1i;
        for iteration=1:maxIteration
            delta=z*(z^(-n)-1)/n;
            z=z+delta;
            if(abs(delta)<eps)
                break;
            end
        end
        [err,k]=min(abs(Roots-z));
        if(err<=eps)
            Image(i,j,:)=[(k-1)/n,1,1-iteration/maxIteration];
        else 
            Image(i,j,:)=0;
        end
    end
end
image(hsv2rgb(Image));
set(gca,'xtick',[],'ytick',[]);
set(gca,'xColor','w','yColor','w');
title('Басейн Ньютона')

end