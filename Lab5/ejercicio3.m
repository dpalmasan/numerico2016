clear all
close all
clc

% Datos de tabla
x = [1, 2, 5, 15, 25, 30, 35, 40]';
y = [99, 95, 85, 55, 30, 24, 20, 15]';

% Modelo 1
A1 = [ones(size(x)), x];
b1 = log(y);
c1 = A1 \ b1;
alfa1 = exp(c1(1));
beta1 = exp(c1(2));

% Modelo 2
A2 = [ones(size(x)), log(10)*x];
b2 = log(y./(100 - x));
c2 = A2 \ b2;
alfa2 = exp(c2(1));
beta2 = c2(2);

% Mostrar norma 2 del error para cada modelo
fprintf('Norma error modelo 1: %.4f\n', norm(b1 - A1*c1))
fprintf('Norma error modelo 2: %.4f\n', norm(b2 - A2*c2))

% Graficar ambos modelos
xx = linspace(0, 50, 200);
y1 = alfa1*beta1.^xx;
y2 = alfa2*(100 - xx).*10.^(beta2*xx);

plot(x, y, '*b'); hold on; grid on
plot(xx, y1, 'r', xx, y2, 'g')
xlabel('Miles de millas recorridas'); ylabel('Porcentaje Util')
legend('Datos', 'modelo 1', 'modelo 2')

% El mejor modelo es el primero
fprintf('Para 45000 millas se tiene %.2f\n', alfa1*beta1^45);
fprintf('Para 50000 millas se tiene %.2f\n', alfa1*beta1^50);