% a): compute f_hat
a = sqrt(2)/2;
A = zeros(13, 13);
b = [0 10 0 0 0 0 0 15 0 20 0 0 0]';
A(1,2)=1; A(1,6)=-1;
A(2,3)=1;
A(3,1)=a; A(3,4)=-1; A(3,5)=-a;
A(4,1)=a; A(4,3)=1; A(4,5)=a;
A(5,4)=1; A(5,8)=-1;
A(6,7)=1;
A(7,5)=a; A(7,6)=1; A(7,9)=-a; A(7,10)=-1;
A(8,5)=a; A(8,7)=1; A(8,9)=a; 
A(9,10)=1; A(9,13)=-1;
A(10,11)=1;
A(11,8)=1; A(11,9)=a; A(11,12)=-a;
A(12,9)=a; A(12,11)=1; A(12,12)=a;
A(13,12)=a; A(13,13)=1;
f_hat = A\b;

%b using 2 norm
condition = cond(A);
relative_residual = norm(b-(A*f_hat))/norm(b);
upper_bound = condition*relative_residual;
lower_bound = relative_residual/condition;


