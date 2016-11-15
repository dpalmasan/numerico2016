clear all
close all
clc

% Datos de tabla
x = 0:.5:10;
y = [2.5, 2.8, 3, 3.3, 3.8, 4.8, 4.8, 5, 4.8, 4.7, 4.7, 4.5, 4.5, ...
    4.4, 4.3, 4.4, 4.2, 4, 4.1, 4.3, 3.5];

% 4.1
p = polyfit(x, y, 20);
xx = linspace(0, 10, 200);
figure;
plot(x, y, '*r'); hold on; grid on
plot(xx, polyval(p, xx), 'b')

% Ajustar ejes para visualizar
axis([0, 10, min(y), max(y)])

% 4.3
figure;
plot(x, y, '*r'); hold on; grid on
plot(xx, polyval(p, xx), 'b')
plot(xx, funcion_ejercicio4(xx), 'g')
axis([0, 10, min(y), max(y)])
legend('Puntos', 'Polinomio', 'Spline')
