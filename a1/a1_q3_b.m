x1 = 1;
x2 = 10;
dx = 10^(-10);
y1 = log(x1);
y2 = log(x2);
y1_hat = log(x1 + dx);
y2_hat = log(x2 + dx);
condition1 = abs((y1_hat - y1)/(y1))/abs(dx/x1);
condition2 = abs((y2_hat - y2)/(y2))/abs(dx/x2);
fprintf('condition1: %f\n', condition1);
fprintf('condition2: %f\n', condition2);
