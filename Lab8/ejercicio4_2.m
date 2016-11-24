clear all
close all
clc

% funciones f y g
f = @(x) exp(x - x.^2);
g = @(x) atan(x.^2);

x = linspace(-3, 3);

plot(x, f(x), 'r', x, g(x), 'b'); grid on
legend('f', 'g')

% Definimos h(x) = f(x) - g(x)
h = @(x) f(x) - g(x);

x1 = fzero(h, -1);
x2 = fzero(h, 1);

% Integral entre -3 y 3
I = -quad(h, -3, x1) + quad(h, x1, x2) - quad(h, x2, 3);

disp(I)