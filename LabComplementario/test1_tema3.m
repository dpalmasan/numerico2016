clear all
close all
clc

% Tabla de datos
t = [0.0 0.25 0.50 0.75 1.0 1.25 1.50 1.75 2.0]';
f = [20 52 69 75 74 68 55 38 17]';

% Calcular y mostrar est para cada alfa
for alfa = [-3, -2, -1]
    [coef, est] = funcion_test1_tema3(t, f, alfa);

    fprintf('-----------------\n')
    fprintf('Para alfa = %d: \n', alfa);
    fprintf('-----------------\n\n')

    fprintf('Estimacion: \n')
    disp(est)
    fprintf('Coeficientes a, b, c, d: \n')
    disp(coef')
end

% Ejecutando, se encuentra que el mejor alfa es -3
alfa = -3;
[coef, est] = funcion_test1_tema3(t, f, alfa);

% Puntos utilizados para graficar modelo ajustado
tt = linspace(0, 2, 200);
yy = coef(1) + coef(2)*tt + coef(3)*tt.^2 + coef(4)*exp(alfa*tt);

% Graficar
plot(t, f, '*r'); hold on
plot(tt, yy, 'b')
legend('Puntos', 'Modelo Ajustado')