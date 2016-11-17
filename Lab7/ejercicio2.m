clear all
close all
clc

% Funciones a integrar
f1 = @(x) exp(-x.^2);
f2 = @(x) sqrt(x);

% Calcular con tolerancia prefijada
fprintf('Con tolerancia prefijada: \n')
quad(f1, -1, 1)
quad(f2, 0, 1)

% Calcular con tolerancia 1e-6
fprintf('Con tolerancia 10^-6: \n')
quad(f1, -1, 1, 1e-6)
quad(f2, 0, 1, 1e-6)