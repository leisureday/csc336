function y = exp2(x)
x = x/10;
old_sum = -1;
new_sum = 0;
k = 0;
while old_sum ~= new_sum
    old_sum = new_sum;
    new_sum = new_sum + (x^k)/factorial(k);
    k = k+1;
end
y = new_sum^10;