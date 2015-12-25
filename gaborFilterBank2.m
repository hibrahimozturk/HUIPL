g = zeros(30,30);
lambda = 10;
tetav = pi/2;
phi = 2;
sigma = 1/(4*sqrt(2));
alpha = 0.1;

for x = 1:30
    for y = 1:30
        xprime = (x-((30+1)/2))*cos(tetav)+(y-((30+1)/2))*sin(tetav);
        yprime = -(x-((30+1)/2))*sin(tetav) + (y-((30+1)/2))*cos(tetav);
        g(x,y) = exp(-(xprime^2 + alpha^2*yprime^2)/(2*sigma^2)) * exp(1i*(2*pi*(xprime/lambda)+phi));
    end
end
imshow(abs(g));
% hold on;