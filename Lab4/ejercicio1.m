clear all
close all
clc

% 1.1
n = 100;
a = 4;
b = 2;
c = 2;
d = 7;

A = matriz_preg1_lab4(n, a, b, c, d);

% 1.2

% se observa la estructura de la matriz, muchos elementos nulos
spy(A)

% Cantidad de elementos que no son 0, se observa que aproximadamente el 3%
% de la matriz son elementos no nulos (matriz disprsa)
nnz(A)

% 1.3
B = sparse(A);
C = matriz_preg1_lab4_sparse(100, 4, 2, 2, 7);