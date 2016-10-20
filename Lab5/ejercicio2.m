clear all
close all
clc

% Datos de tabla
t = [0.5, 1, 2, 3, 4]';
p = [7, 5.2, 3.8, 3.2, 2.5]';

% Matriz asociada al problema
A = [exp(-1.5*t), exp(-.3*t), exp(-.05*t)];

% Coeficientes
c = A \ p;

% Graficar
tt = linspace(0, 6, 200);
pp = c(1)*exp(-1.5*tt) + c(2)*exp(-.3*tt) + c(3)*exp(-.05*tt);

plot(t, p, '*b'); hold on; grid on
plot(tt, pp, 'r')
xlabel('t (horas)'); ylabel('p (miles)')
legend('Datos', 'Modelo Ajustado')

% Inicialmente
pin = c(1) + c(2) + c(3);

% Hora y media
p1 = c(1)*exp(-1.5*1.5) + c(2)*exp(-.3*1.5) + c(3)*exp(-.05*1.5);

% Despues de 5 horas y media
p2 = c(1)*exp(-1.5*5.5) + c(2)*exp(-.3*5.5) + c(3)*exp(-.05*5.5);

fprintf('Inicialmente habia %.2f (miles) de organismos, despues de hora y media habia %.2f, ', pin, p1)
fprintf('\ny despues de 5 horas y media habia %.2f\n', p2)