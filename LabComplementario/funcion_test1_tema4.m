function M = funcion_test1_tema4(n)
% Crear matriz A
A = eye(n);
A(1, :) = 1;
A(:, 1) = 1;

% Matriz B
B = diag(1:n);

% Matriz identidad y matriz nula
I = eye(n);
Theta = zeros(n);

M = [A, B, Theta; B, I, A; Theta, A, I];
end