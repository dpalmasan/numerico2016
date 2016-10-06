function A = create_trid(n, a, b, c)

v = ones(n-1, 1);
A = a*eye(n) + b*diag(v, 1) + c*diag(v, -1);
end