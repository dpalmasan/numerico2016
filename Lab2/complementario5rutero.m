clear all
close all
clc

% Calculos previos
[M5, b5] = complementario5(5);
[M8, b8] = complementario5(8);
[M10, b10] = complementario5(10);

% Datos de tabla
norm(M5, 2)
norm(M8, inf)
norm(M10, 1)
det(M5)
norm(M5\b5, 2)