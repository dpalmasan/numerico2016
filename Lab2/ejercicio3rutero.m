clear all
close all
clc

m = 4;
n = 6;

[M, b] = ejercicio3(m, n);

x = M\b;

norm(M*x - b, 1)
norm(M*x - b, 2)
norm(M*x - b, inf)