clear all
close all
clc

% Valores de la tabla
aditivo = (0:8)';
tsecado = [12, 10.5, 10, 8, 7, 8, 7.5, 8.5, 9.0]';

% Sistema de ecuaciones asociado
A = [aditivo.^2, aditivo, ones(size(aditivo))];

% Encontrar coeficientes
c = A\tsecado;

% Graficar
xx = linspace(0, 8, 100);
yy = polyval(c, xx);

plot(aditivo, tsecado, '*b'); hold on; grid on
plot(xx, yy, 'r')
xlabel('Aditivo (gramos)'); ylabel('Tiempo de Secado [horas]')
legend('Datos', 'Modelo Ajustado')

% Cantidad de aditivo que resulta en tiempo minimo de secado
aditivo_min = -c(2)/(2*c(1));
t_min = polyval(c, aditivo_min);

fprintf('La cantidad de aditivo %.2f gramos, resulta ', aditivo_min); 
fprintf('en el tiempo minimo de secado de %.2f horas\n', t_min)


