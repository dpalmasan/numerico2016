clear all
close all
clc

% Testeamos la implementacion del metodo RK45 y la comparamos con ode45, el
% cual utiliza este metodo (con algunas hierbas extras para hacerlo mas
% eficiente y utilizable)
dy = @(x, y) log(x);

[x1, y1] = ode45(dy, [1, 3], 0);
[x2, y2] = RK45(dy, [1, 3], 0);
plot(x1, y1, 'r', x2, y2, '--b')
