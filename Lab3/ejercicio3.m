clear all
close all
clc

n = 10;
A = n*eye(n) + ones(n);
b = ones(n, 1);

if norm(A - A') == 0
    fprintf('Matriz A es simetrica\n');
else
    fprintf('Matriz A no es simetrica\n');
end

if all(eig(A) > 0)
    fprintf('Matriz A es definida positiva\n');
else
    fprintf('Matriz A no es definida positiva\n');
end

% Calcular factorizacion de Cholesky, y que devuelva triangular inferior
L = chol(A, 'lower');

% Resolver sistema de ecuaciones
xchol = L' \ (L \ b);