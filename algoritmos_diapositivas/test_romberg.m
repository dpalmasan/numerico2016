clear all
close all
clc

% Rutero para testear la implementacion del metodo romberg
f = @(x) exp(-x.^2);
a = 0;
b = 1;
h = 0.5;

romberg(f, a, b, h)