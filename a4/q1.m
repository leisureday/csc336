iters = 5;
xns = zeros(iters+1, 1); xns(1) = 1;
fprintf('n%20s%20s\n','x(n)','x(n)-sqrt(2)');
fprintf('%d%20.16f%20.16f\n',0,xns(1),xns(1)-sqrt(2));
for n = 1:iters
    xnm1 = xns(n);
    xn = xnm1-(xnm1^2-2)/(2*xnm1);
    xns(n+1) = xn;
    fprintf('%d%20.16f%20.16f\n',n,xn,xn-sqrt(2));
end
