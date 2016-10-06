clear all
close all
clc

% Paso a considerar
h = 0.1;

% Calcular matrices
[A, b] = ejercicio5fun(h);

% Factorizacion Cholesky
L = chol(A, 'lower');

% Resolver sistema
ux = L' \ (L \ b);

% Vector x discreto (se saca del enunciado, recordar leer enunciados y 
% ENTENDERLOS ;D).
xd = (0:h:1)';
ud = [1;ux;1];

% Generar 100 pts equiespaciados
x = linspace(0, 1);

% Generar valores de u evaluada en x (aqui SI SE NECESITA el .*)
u = 2*x.^2 - 2*x + 1;

% Hacer un grafico piola, easy no? ;)
plot(x, u, 'b', xd, ud, 'or', 'linewidth', 2);
grid on
xlabel('x')
ylabel('u')
legend('Solucion real', 'Solucion discreta')

