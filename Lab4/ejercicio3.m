clear all
close all
clc

% Aca solo sigo las instrucciones al pie de la letra
% 3.1
load elsurdata

A = creatematrix_pagerank(Gelsur);

% 3.2
spy(A)

% Se observa que la matriz A es dispersa. Tambien que no es simetrica, ello
% puede comprobarse haciendo norm(A - A', inf)

[L, U] = lu(A);

fprintf('La matriz A tiene %d elementos distintos de cero\n', nnz(A));
fprintf('La matriz L tiene %d elementos distintos de cero\n', nnz(L));
fprintf('La matriz U tiene %d elementos distintos de cero\n', nnz(U));

% Observar que L y U tienen muchos menos elementos nulos que A.

% 3.3

n = size(A, 1);
% Vector e del sistema de la guia
e = ones(n, 1);
x0 = zeros(n, 1);
maxiter = 1000;
tol = 1e-3;

% Utilizar metodos iterativos
[xj,convj,iterjac] = jacobisol(A,e,x0,tol,maxiter);
[xgs,convg,itergs] = gaussseidelsol(A,e,x0,tol,maxiter);
[xgc, flag, relres, itergc] = pcg(A,e,tol,maxiter);

% Notar que metodos de Jacobi y Gauss-Seidel convergen. Metodo del
% gradiente conjugado no converge pues A no es simetrica.

% 3.4 
% En este ejercicio abro mostrarrangos y veo como funciona, solo asi puedo
% saber como utilizar la funcion ;).
mostrarrangos(xgs,Gelsur,Uelsur, '10 paginas con mayor PageRank')
