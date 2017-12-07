function q1()
    find_root('newton', 5, 1);
    find_root('secant', 7, [1 2]);
end


function find_root(method, iters, x)
    % a): find root using newton's method
    if strcmp(method, 'newton')
        xns = zeros(iters+1, 1); xns(1) = x;
        fprintf('n%20s%20s\n','x(n)','x(n)-sqrt(2)');
        fprintf('%d%20.16f%20.16f\n',0,xns(1),xns(1)-sqrt(2));
        for n = 1:iters
            xnm1 = xns(n);
            xn = xnm1-f(xnm1)/(2*xnm1);
            xns(n+1) = xn;
            fprintf('%d%20.16f%20.16f\n',n,xn,xn-sqrt(2));
        end
        fprintf('\n');

    elseif strcmp(method, 'secant')
        xns = zeros(iters+1, 1); xns(1) = x(1); xns(2) = x(2);
        fprintf('n%20s%20s\n','x(n)','x(n)-sqrt(2)');
        fprintf('%d%20.16f%20.16f\n',0,xns(1),xns(1)-sqrt(2));
        fprintf('%d%20.16f%20.16f\n',1,xns(2),xns(2)-sqrt(2));       
        for n = 2:iters
            xnm1 = xns(n);
            xnm2 = xns(n-1);
            xn = xnm1-f(xnm1)*(xnm1-xnm2)/(f(xnm1)-f(xnm2));
            xns(n+1) = xn;
            fprintf('%d%20.16f%20.16f\n',n,xn,xn-sqrt(2));
        end       
        fprintf('\n');
    end
end


function y = f(x)
    y = x^2-2;
end