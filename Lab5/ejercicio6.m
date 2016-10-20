clear all
close all
clc

% Datos
t = (0:10)';
n = [5.03, 4.71, 4.4, 3.97, 3.88, 3.62, 3.30, 3.15, 3.08, 2.92, 2.70]';

% Sistema de ec.
A = [ones(size(t)), t];
b = 1./n;

% Coeficientes
c = A \ b;

n0 = 1/c(1);
alfa = c(2);

% Graficar
tt = linspace(0, 10, 110);
nn = n0 ./ (1 + n0*alfa*tt);

plot(t, n, '*b'); hold on; grid on
plot(tt, nn, 'r')
xlabel('tiempo [seg]'); ylabel('n [x10^{-4}]')
legend('Datos', 'Modelo Ajustado')