clear all
close all
clc

T = [1, 0, 0, 0;2, 1, 0, 0;3, 2, 1, 0;4, 3, 2, 1];
[Tinv, p] = complementario6(T);

% Datos pedidos
Tinv(2, 1)
Tinv(3, 1)