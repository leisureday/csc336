n = 60;
A = ones(n, n);
A = A - triu(A);
A = eye(n)-A;
A = A+[ones(n-1,1);0]*[zeros(1,n-1),1];
Q = diag(ones(n-1,1),1);
Q(n,1) = 1;
[L1,U1,P1] = lu(A); % partial pivoting
[L2,U2] = lu(A*Q); % complete pivoting
x = ones(n,1);
b = A*x;
% poor approximation
y1 = L1\b;
x1 = U1\y1;
norm1 = norm(x-x1,inf);
% good approximation
y2 = L2\b;
z = U2\y2;
x2 = Q*z;
norm2 = norm(x-x2,inf);
% print result
fprintf('norm(x-x1,inf): %f; norm(x2-x,inf): %f\n',norm1,norm2);