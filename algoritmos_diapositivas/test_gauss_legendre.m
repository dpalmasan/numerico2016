clear all
close all
clc

% Testear integral de Gauss-Legendre

f = @(x) exp(-x.^2);
g = @(x) sin(x.^2);

n = 1:16;

I1 = zeros(size(n));
I2 = zeros(size(n));
for i = n
    I1(i) = gauss_legendre(f, -1, 1, i);
    I2(i) = gauss_legendre(g, 0, sqrt(pi), i);
end

format long
disp([n', I1', I2'])