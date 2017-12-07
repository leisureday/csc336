function q = perm_b(p)
np = size(p,1);
q = (1:np+1)';
q = perm_a(p, q);
