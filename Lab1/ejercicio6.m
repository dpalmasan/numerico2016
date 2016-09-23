clear all
close all
clc
 
% Valor de n, puede modificarlo para testear
n = 5;
 
% Guarde sus resultados en la variable r_diag
% NO USAR CICLOS ;)
r_diag = zeros(n);
r_diag(n:n-1:n*n-1) = 1;
 
% Mostrar resultados
disp('r_diag =')
disp(r_diag)