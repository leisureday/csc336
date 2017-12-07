C = zeros(12, 1);
logC = zeros(12, 1);
D = zeros(12, 1);
R = zeros(12, 1);
N = (2:13)';
for n = 2:13
    H = hilb(n);
    x = ones(n,1);
    b = H*x;
    x_hat = H\b;
    relative_error = norm(x-x_hat, inf)/norm(x, inf);
    R(n-1) = relative_error;
    if relative_error >= 1
        max_n = n-1;
    end
    condition = cond(H, inf);
    C(n-1) = condition;
    logC(n-1) = log(condition);
    % use -log10(r_e) to approximate number of correct digits
    num_correct_digits = floor(-log10(relative_error));
    D(n-1) = num_correct_digits;
end

% part1: find the largest n with relative error < 1
fprintf('The largest n with relative error smaller than one: %d\n\n', max_n);

% part2: plot n versus log(cond(hilb(n)))
figure;
plot(N, logC, 'bo');
xlabel('n');
ylabel('cond(hilb(n), inf)');
    
% part3: print table of number of matched digits versus condition    
Table = table(N, R, C, D, 'VariableNames', ...
        {'n', 'relative_error', 'condition_number', 'number_correct_digits'});
disp(Table);