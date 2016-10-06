function [M, b] = ejercicio3(m, n)

theta = zeros(m, n);

% Matriz Am
v1 = m:-1:1;
Am = diag(v1);
Am(1, 2:end) = v1(2:end);
Am(2:end, 1) = v1(2:end);

% Matriz An
v1 = n:-1:1;
An = diag(v1);
An(1, 2:end) = v1(2:end);
An(2:end, 1) = v1(2:end);

M = [Am, theta; theta', An'];

i = (1:m+n)';
b = (1 + 1./i).^i;
end