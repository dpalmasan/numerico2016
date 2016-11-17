clear all
close all
clc

% 5.1

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
%     error(k) = abs(2/3 - trap(@(x) sqrt(x), 0, 1, N(k)));
% end

% Usando arrayfun xD (me gusta mas asi jeje)
error = arrayfun(@(n) abs(2/3 - trap(@(x) sqrt(x), 0, 1, n)), N);

figure(1)
loglog(N, 1./N.^2, 'r', N, error, 'b'); grid on
legend('h^2', 'Error Absoluto')

% En escala logaritmica se observa que las pendientes de las rectas no son
% paralelas, ello nos dice que no decrecen a la misma razon y por tanto en
% este caso el error de la regla de trapecios no es O(h^2)

% 5.2
h = 1./N;
A = [ones(size(error)), log(h)];
b = log(error);
coef = A \ b;
C = coef(1);
alfa = coef(2);

% 5.3
figure(2)
loglog(N, 1./N.^alfa, 'r', N, error, 'b'); grid on
legend('h^\alpha', 'Error Absoluto')