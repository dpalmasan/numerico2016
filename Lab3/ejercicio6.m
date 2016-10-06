clear all
close all
clc

% Parametros
W = 200;
S = 50;
xin = 0.075;
yin = 0;
n = 6;
m = 7;

% Sistema de ecuaciones
[A, b] = reactor(W, S, n, m, xin, yin);
x = A\b;

% Mostrar solucion
disp(x)