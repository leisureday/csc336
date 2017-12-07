function q2()
    find_root('g1', 10, 2.5);
    find_root('g2', 10, 2.5);
    find_root('g3', 10, 2.5);
    find_root('g4', 10, 2.5);
end


function find_root(method, iters, x)
    % get the corresponding c
    switch method
        case 'g1'
            fprintf('g1\n');
            c = 4/3;
        case 'g2'
            fprintf('g2\n');
            c = 3/4;
        case 'g3'
            fprintf('g3\n');
            c = 1/2;
        case 'g4'
            fprintf('g4\n');
            c = 1;
    end
    xns = zeros(iters+1, 1); xns(1) = x;
    fprintf(' n%24s%24s\n','x(n)','x(n)-2');
    fprintf('%2.d%24.16f%24.16f\n',0,xns(1),xns(1)-2);
    r = 0;
    for n = 1:iters
        % compute xn based on different g
        xnm1 = xns(n);
        if strcmp(method, 'g1')
            xn = g1(xnm1);
        elseif strcmp(method, 'g2')
            xn = g2(xnm1);
        elseif strcmp(method, 'g3')
            xn = g3(xnm1);
        elseif strcmp(method, 'g4')
            xn = g4(xnm1);
        end
        xns(n+1) = xn;
        % print n, xn, xn-2
        if xn<100
            fprintf('%2.d%24.16f%24.16f\n',n,xn,xn-2);
        else
            fprintf('%2.d%24.d%24.d\n',n,xn,xn-2);
        end
        % approximate convergence rate
        if xn == 2 && r == 0 % converged
            r = rate(c, xns(n), xns(n-1));
        elseif n == iters && r == 0 
            r = rate(c, xns(n+1), xns(n));
        end
    end
    fprintf('approximate convergence rate: %d\n\n', r);
end


function y = g1(x)
    y = (x^2+2)/3;
end


function y = g2(x)
    y = sqrt(3*x-2);
end


function y = g3(x)
    y = 3-2/x;
end


function y = g4(x)
    y = (x^2-2)/(2*x-3);
end


function r = rate(c, xn, xnm1)
    r = log(abs(xn-2)/c)/log(abs(xnm1-2));
end