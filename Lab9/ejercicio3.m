clear all
close all
clc

% Solo para practicar, este ejercicio lo haremos utilizando funciones
% anonimas. Para mayor explicacion, insisto, ver los tips que puse en la
% web.
gamma = 1.4;

% 3.1 PVI
dr = @(t, r) [r(2); (r(1)^(-3*gamma) - 1 - 3/2*r(2)^2)/r(1)];

% 3.2
A = 2.5;
ts = [0, 20];
r0 = [A, 0];

[t, r] = ode45(dr, ts, r0);

% 3.3
R = 3e-6 * r(:, 1);
plot(t, R, 'b'); grid on
