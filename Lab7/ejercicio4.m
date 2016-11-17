clear all
close all
clc

% 4.1

% Subintervalos a considerar
N = (10:10:100)';

% Cantidad de elementos de N
n = length(N);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Version con ciclo
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Vector donde se almacenaran errores absolutos
% error = zeros(n, 1);
% 
% for k = 1:n
%     error(k) = abs(1 - exp(-1) - trap(@(x) exp(-x), 0, 1, N(k)));
% end

% Usando arrayfun xD (me gusta mas asi jeje)
error = arrayfun(@(n) abs(1 - exp(-1) - trap(@(x) exp(-x), 0, 1, n)), N);

% 4.2
loglog(N, 1./N.^2, 'r', N, error, 'b'); grid on
legend('h^2', 'Error Absoluto')

% 4.3
% En escala logaritmica se observa que las pendientes de las rectas son
% paralelas, ello nos dice que decrecen a la misma razon y por tanto en
% este caso el error de la regla de trapecios es O(h^2)