clear all
close all
clc

% Datos
x = [0.9 1.3 1.9 2.1 2.6 3 3.9 4.4 4.7 5 6 7 8 9.2 10.5 11.3 ...
    11.6 12 12.6 13 13.3];
y = [1.3 1.5 1.85 2.1 2.6 2.7 2.4 2.15 2.05 2.1 2.25 2.3 2.25 1.95 ...
    1.4 0.9 0.7 0.6 0.5 0.4 0.25];

% 3.1
p = polyfit(x, y, length(x) - 1);

% 3.2
xx = linspace(0.9, 13.3);
figure;
plot(x, y, '*r'); hold on
plot(xx, polyval(p, xx), 'b');
legend('Puntos', 'Polinomio Interpolacion')
axis equal

% 3.3
s = spline(x, [0 y 0]);
figure;
plot(x, y, '*r'); hold on
plot(xx, ppval(s, xx), 'b');
legend('Puntos', 'Spline')
axis equal