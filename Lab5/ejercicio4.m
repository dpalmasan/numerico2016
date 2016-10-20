clear all
close all
clc

% Datos de tabla
dosis = [0.25, 1, 1.5, 2.5, 7.5]';
aumento = [-10.8, 13.5, 16.4, 28.7, 51.3]';

% Sistema de ecuaciones
A = [ones(size(dosis)), log10(dosis)];

% Coeficientes
c = A\aumento;

% Graficar
d = linspace(0.25, 7.5, 100);
a = c(1) + c(2)*log10(d);

plot(dosis, aumento, '*b'); hold on; grid on
plot(d, a, 'r');
xlabel('Dosis [mg]'); ylabel('Aumento de Peso [g]')
legend('Datos', 'Modelo Ajustado')

% Para no aumentar de peso, se despeja la ec: 0 = a + blog10(dosis)
dosis_no_aumento = 10^(-c(1)/c(2));
fprintf('Para no aumentar de peso se requiere una dosis de: %.2f [mg]\n', dosis_no_aumento)

