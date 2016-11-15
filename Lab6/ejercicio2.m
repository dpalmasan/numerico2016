clear all
close all
clc

% 2.1
x = 1:3;
y = log(x);
p = polyfit(x, y, 2);

% 2.2
xx = linspace(1, 3, 200);
figure;
plot(x, y, '*r'); hold on
plot(xx, polyval(p, xx), 'b')
legend('Puntos', 'Polinomio')

% 2.3
h = 1/50;
xi = 1:h:3;

error_absoluto = abs(log(xi) - polyval(p, xi));
cota_error = 1/3 * abs((xi - 1).*(xi - 2).*(xi - 3));

figure;
plot(xi, error_absoluto, 'b'); hold on; grid on
plot(xi, cota_error, 'r');
legend('Error Absoluto', 'Cota de Error')