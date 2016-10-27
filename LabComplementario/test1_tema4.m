clear all
close all
clc

% Llamar a la funcion con n = 4
n = 4;
M = funcion_test1_tema4(n);

% Calcular factorizacion lu con pivoteo parcial
[L, U, P] = lu(M);

% Resolver de forma directa
b = ones(3*n, 1);

x = M \ b;

% Resolver usando factorizacion
xlu = U \ (L \ (P*b));

% Mostrar valores de tabla (no es la forma mas elegante, pero bueh...)
fprintf('Norma 2 de M:\n')
disp(norm(M));

fprintf('Norma 2 de x (sol. directa y LU): \n')
disp([norm(x), norm(xlu)])

fprintf('Norma 2 del residuo (sol. directa y LU): \n')
disp([norm(b - M*x), norm(b - M*xlu)])

