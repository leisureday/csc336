function y = perm_c(q,x)
y = x;
np = size(q, 1);
for i = 1:np
    j = q(i);
    y(i,:) = x(j,:);
end