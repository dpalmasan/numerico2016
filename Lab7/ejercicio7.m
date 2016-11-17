clear all
close all
clc

% Graficar
t = linspace(-pi, pi, 200);
plot(3*cos(t), 5*sin(t)); grid on
axis equal

% Perimetro de la elipse
quad(@(t) sqrt(9*sin(t).^2 + 25*cos(t).^2), -pi, pi)