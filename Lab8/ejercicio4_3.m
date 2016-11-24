clear all
close all
clc

% Definimos la funcion a la cual encontrar la raiz
f = @(x) quad(@(t) sin(t.^2), 0, x) - sqrt(pi)/4;

xx = linspace(-3, 3);

% Graficamos, notar que usamos arrayfun pues quad no permite que le pasemos
% un vector en los limites de integracion. La otra forma de hacerlo es con
% ciclos.
plot(xx, arrayfun(f, xx), 'b'); grid on

x1 = fzero(f, 1);
x2 = fzero(f, 2);
x3 = fzero(f, 3);

fprintf('Las raices encontradas son: '); disp([x1, x2, x3])