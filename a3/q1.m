% a
errora = zeros(10, 2);
gammas = zeros(10, 1);
for k = 1:10
    gamma = 10^((-2)*k);
    gammas(k) = gamma;
    b = [1; 1];
    x = [1; -1];
    L1 = [1 0; 2/gamma 1];
    U1 = [gamma gamma-1; 0 2/gamma-1];
    y = L1\b;
    x_hat = U1\y;
    error = x_hat - x;
    errora(k, :) = error';
end
for k = 1:10
    fprintf('gamma: 10^(-2*%d); error1: %d; error2: %d\n', k, errora(k,1), errora(k,2));
end

% b
errorb = zeros(10, 2);
for k = 1:10
    gamma = 10^((-2)*k);
    b_tilt = [1; 1];
    x = [1; -1];
    L2 = [1 0; gamma/2 1];
    U2 = [2 1; 0 gamma/2-1];
    y = L2\b;
    x_hat = U2\y;
    error = x_hat - x;
    errorb(k, :) = error';
end
for k = 1:10
    fprintf('gamma: 10^(-2*%d); error1: %d; error2: %d\n', k, errorb(k,1), errorb(k,2));
end

% c
errorc = zeros(10, 2);
for k = 1:10
    gamma = 10^((-2)*k);
    A = [gamma gamma-1; 2 1];
    b = [1; 1];
    x = [1; -1];
    L1 = [1 0; 2/gamma 1];
    U1 = [gamma gamma-1; 0 2/gamma-1];
    y = L1\b;
    x_hat = U1\y;
    r = b - A*x_hat;
    z = L1\r;
    e = U1\z;
    x_tilt = x_hat+e;
    error = x_tilt - x;
    errorc(k, :) = error';
end
for k = 1:10
    fprintf('gamma: 10^(-2*%d); error1: %d; error2: %d\n', k, errorc(k,1), errorc(k,2));
end
