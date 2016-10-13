function A = matriz_preg1_lab4(n, a, b, c, d)
v = ones(n-1, 1);
D = d*diag(ones(3, 1), n - 3);
A = a*eye(n) + b*diag(v, 1) + c*diag(v, -1) + D + D';