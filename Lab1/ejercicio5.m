clear all
close all
clc
 
% Matriz A (No modificar)
rng(3)
A = floor(rand(20)*10);
 
% Sus resultados debera guardarlos en la variable output
% NO USAR CICLOS
output = sum(A(1, 1:end)) + sum(A(end, 1:end)) + sum(A(2:end-1, 1)) + ...
    sum(A(2:end-1, end));
 
% Muestra la variable output en consola (No modificar)
disp('output = ')
disp(output)