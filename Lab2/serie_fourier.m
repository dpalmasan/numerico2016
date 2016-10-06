clear all
close all
clc

% Periodo
T = 2;

% Intervalo de tiempo y puntos a graficar
t = linspace(-T/2, T/2, 500);

% Onda cuadrada
y = double(t >= 0) - double(t < 0);

% Cantidad de armonicos a considerar
n = 10;

%%%%%%%%%%%%%%%%%%%%%%%%%%
% TODO: Completar Codigo %
%%%%%%%%%%%%%%%%%%%%%%%%%%

x = 0;

for k = 1:n
    x = x + sin(2*pi/T *(2*k-1)*t) / (2*k - 1);
end
x = 4/pi*x;


plot(t, y, 'b'); hold on
plot(t, x, 'r')
grid on; legend('Onda Cuadrada', 'Serie de Fourier')
xlabel('tiempo')
ylabel('Amplitud')
title('Expansion en Serie de Fourier')
axis([-1, 1, -1.5, 1.5])

