clear all
close all
clc

% Datos de tabla
t = [1 2 3 4 5 6 7]';
y = [1.4 1 0.9 0.7 0.6 0.55 0.5]';

% No se hara con factorizacion QR porque no lo hemos visto

% Matriz del problema (Resulta de linealizar el modelo)
A = [ones(length(t), 1), log(t)];
b = log(2./y - 1);

% Ajustar por minimos cuadrados
coef = A \ b;

% Determinar coeficientes y mostrarlos
alfa = exp(coef(1));
beta = coef(2);

fprintf('Alfa y Beta son: \n');
disp([alfa, beta])

% Calcular y mostrar norma 2 del residuo
norma_res = norm(A*coef - b);

fprintf('Norma del Residuo: \n');
disp(norma_res)

% Puntos para dibujar curva en el grafico
tt = linspace(1, 7, 200);
yy = 2./(1 + alfa * tt.^beta);

% Graficar
plot(t, y, '*r'); hold on
plot(tt, yy, 'b');
legend('Puntos', 'Modelo Ajustado')

% Calcular y mostrar estimaciones
test = [4.5, 9];
yest = 2./(1 + alfa*test.^beta);

fprintf('Estimaciones en 4.5 y 9 hrs: \n');
disp(yest)