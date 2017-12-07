function q3()
    a = 3.592;
    b = 0.04267;
    R = 0.082054;
    T = 300;
    Ps = [1 10 100];
    fprintf('%3s%24s%24s\n', 'P', 'v waals', 'v ideal gas law');
    for i = 1:length(Ps)
        P = Ps(i);
        v0 = ideal_gas_law(P, R, T);
        v = waals(a, b, P, R, T, v0);
        fprintf('%3.d%24.16f%24.16f\n',P,v,v0);
    end
end

% compute v using waals
function v = waals(a, b, P, R, T, v0)
    fun = @(v) (P+a/(v^2))*(v-b)-R*T;
    v = fzero(fun, v0);
end

% compute v using ideal gas law
function v = ideal_gas_law(P, R, T)
    v = R*T/P;
end