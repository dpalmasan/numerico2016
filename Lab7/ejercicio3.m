clear all
close all
clc

% Testear con algunas integrales

% Valor real 1/4
integral_doble(@(x, y) x*y, 0, 1, 0, 1, 1000)

% Valor real 2/3
integral_doble(@(x, y) x*y.^2, 0, 2, 0, 1, 1000)

% Valor real es 44 - 4/3
integral_doble(@(x, y) x*y + x.^2*y.^3, 1, 3, 0, 2, 1000)