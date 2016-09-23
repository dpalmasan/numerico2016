clear all
close all
clc
 
% Matriz M (No modificar)
M = magic(10);
 
% Sus resultados debera guardarlos en la variable output
% NO USAR CICLOS

[r, c] = size(M);
filas = 2:2:r;
colum = 2:2:c;

output = M(filas, colum);
% Muestra la variable output en consola (No modificar)
disp('output = ')
disp(output)