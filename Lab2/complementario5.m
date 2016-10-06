function [Mn, bn] = complementario5(n)

% Generar submatrices
A = zeros(n);

for i = 1:n
    A(i, :) = i:1:(n+i-1);
end

B = fliplr(2*eye(n));
C = [zeros(n, 1), ones(n, n-1)];

Mn = [A, 5*eye(n);B, C];
bn = (2*n:-1:1)';

end