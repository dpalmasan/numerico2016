clear all
close all
clc
 
% Matriz M (No modificar)
M = magic(10);
 
% Entero n
n = 3;
 
% Sus resultados debera guardarlos en la variable output
% NO USAR CICLOS
N = size(M, 2);
output = M(1:n, N-n+1:N);
 
% Muestra la variable output en consola (No modificar)
disp('output = ')
disp(output)