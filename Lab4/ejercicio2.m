clear all
close all
clc

n = 50;
a = 4;
b = 1;
c = 1;
d = -1;

A = matriz_preg1_lab4_sparse(n, a, b, c, d);

% Se almacenan como sparse
D = diag(diag(A));
E = D - tril(A);
F = D - triu(A);

% Matrices de iteracion
Mjac = D \ (E + F);
Mgs  = (D - E)\F;

% Radios espectrales (seran menores que 1 en este caso, lo que significa
% que los metodos seran convergentes
rjac = max(abs(eigs(Mjac)));
rgs = max(abs(eigs(Mgs)));

% Aca genero la tabla, no es necesario hacerlo asi
b = ones(50, 1);
x0 = zeros(50, 1);
maxiter = 100;

fprintf('**************************************\n');
fprintf('Comparacion Jacobi y Gauss-Seidel\n');
fprintf('**************************************\n\n');

fprintf('tol \t| iter jac \t| iter GS \t| norma\n');
fprintf('------------------------------------------\n');
for tol = [1e-2, 1e-4, 1e-6]
    [xj,convj,iterjac] = jacobisol(A,b,x0,tol,maxiter);
    [xgs,convg,itergs] = gaussseidelsol(A,b,x0,tol,maxiter);
    fprintf('%.0e \t| %d \t\t| %d \t\t| %.4f\n', tol, iterjac, itergs, norm(xj - xgs));
end

% Gradiente conjugado
fprintf('\n\n\n**************************************\n');
fprintf('Gradiente Conjugado\n');
fprintf('**************************************\n\n');

fprintf('tol \t| iter GC \t| relres\n');
fprintf('--------------------------------\n');
for tol = [1e-2, 1e-4, 1e-6]
    [~, ~, relres, iter] = pcg(A,b,tol);
    fprintf('%.0e \t| %d \t\t| %.4f\n', tol, iter, relres);
end

% Probando con matriz mal condicionada
A = gallery('poisson', 100);
fprintf('\n\nNumero de condicion de A: %d\n', condest(A));

b = ones(10000, 1);
[~, flag, relres, iter] = pcg(A,b,1e-3);
fprintf('flag pcg: %d\n', flag)

% Gradiente conjugado Precondicionado
fprintf('\n\n**************************************\n');
fprintf('Gradiente Conjugado Precondicionado\n');
fprintf('**************************************\n\n');

fprintf('tol \t| iter GCP \t| norma\n');
fprintf('--------------------------------\n');
for tolp = [0.2, 0.01, 0.001]
    L = ichol(A,struct('type','ict','droptol',tolp));
    P = L*L';
    [~, ~, relres, iter] = pcg(A, b, tol, 100, P);
    fprintf('%.3f \t| %d \t\t| %.4f\n', tolp, iter, norm(P - A, inf));
end