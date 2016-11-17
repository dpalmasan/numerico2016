clear all
close all
clc

% 1.2 Lo mostraremos de forma "bonita", pero no es necesario hacerlo asi,
% solo lo hago asi porque me resulta mas simple :)
fprintf('-----------------------------\n')
fprintf('Regla de Trapecios\n')
fprintf('-----------------------------\n\n')
for N = [10, 20, 40, 80]
    fprintf('N = %d ', N)
    disp([trap(@(x) x.^2, 0, 3, N), trap(@(x) exp(-x.^2), -1, 1, N), ...
        trap(@(x) log(x), 1, 2, N), trap(@(x) sqrt(x), 0, 1, N)])
end

% 1.3
fprintf('-----------------------------\n')
fprintf('Regla de Simpson\n')
fprintf('-----------------------------\n\n')
for N = [10, 20, 40, 80]
    fprintf('N = %d ', N)
    disp([simpson(@(x) x.^2, 0, 3, N), simpson(@(x) exp(-x.^2), -1, 1, N), ...
        simpson(@(x) log(x), 1, 2, N), simpson(@(x) sqrt(x), 0, 1, N)])
end