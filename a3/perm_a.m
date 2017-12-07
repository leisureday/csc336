function y = perm_a(p,x)
y = x;
num_row = size(p, 1);
for i = 1:num_row
    j = p(i);
    temp = y(i,:);
    y(i,:) = y(j,:);
    y(j,:) = temp;
end