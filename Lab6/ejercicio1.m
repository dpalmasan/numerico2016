clear all
close all
clc

% Datos
x = [-2 -1 0 1 2];
y = [-25 -4 -1 8 47];

% 1.1 Calcular Polinomios
p1 = polyfit(x, y, 1);
p2 = polyfit(x, y, 2);
p3 = polyfit(x, y, 3);
p4 = polyfit(x, y, 4);
p5 = polyfit(x, y, 5);

% 1.2 Graficar

% Crear 100 puntos entre -2 y 2
xx = linspace(-2, 2);

figure;
plot(x, y, '*r'); hold on; grid on
plot(xx, polyval(p1, xx), 'b')
plot(xx, polyval(p2, xx), 'g')
plot(xx, polyval(p3, xx), 'm')
plot(xx, polyval(p4, xx), 'k')
plot(xx, polyval(p5, xx), 'c')
legend('datos', 'p_1', 'p_2', 'p_3', 'p_4', 'p_5')
xlabel('x'); ylabel('y'); title('Polinomos ajustados')

% 1.3 Crear polinomio q y graficar
figure;
q = [1, 0, -1, 3, 6, -1];
plot(x, y, '*r'); hold on; grid on
plot(xx, polyval(q, xx), 'b')
legend('datos', 'q')
xlabel('x'); ylabel('y');

% 1.4
% Los polinomios p3, p4, p5, y q interpolan los pares de la tabla

% 1.5
% No, pues es el mismo polinomio

% 1.6
% No, pues el teorema enuncia la existencia y unicidad de un polinomio de
% grado menor o igual a n, cuando se tienen n + 1 puntos. Podrian existir
% infinitos polinomios de grado mayor o n que interpolen los puntos
% (Recordar el sistema de ecuaciones asociado al problema.