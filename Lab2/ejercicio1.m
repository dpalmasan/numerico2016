function normaerror = ejercicio1(n)
v = 1:n-1;
An = diag(v, 1) + diag(v, -1) + diag(n:-1:1);
bn = ((1:n) ./ (n:-1:1))';

x = An\bn;
normaerror = norm(An*x - bn);

end