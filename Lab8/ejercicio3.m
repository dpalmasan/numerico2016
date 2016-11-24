clear all
close all
clc

% Se define n
n = 30;

% 3.1

% Inicializar valores
h = 2*pi/n; x0 = 0; y0 = 1;

% Para i = 1, ..., n - 1, aqui se hace un ajuste porque se asume que los
% indices comienzan de 0, pero matlab empieza a contar de 1
y = zeros(n, 1);
x = zeros(n, 1);

x(1) = x0;
y(1) = y0;
for i = 1:n
    x(i + 1) = i*h;
    y(i + 1) = fzero(@(yi1) y(i) + h*sin(x(i + 1)*yi1) - yi1, y(i));
end

plot(x, y, 'r'); grid on