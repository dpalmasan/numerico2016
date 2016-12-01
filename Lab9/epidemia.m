function dM = epidemia(t, M)
% Funcion utilizada para el problema 1 del lab 9, de calculo numerico. Esta
% funcion representa el P.V.I a resolver en dicho problema

% Parametros
N = 3000;
E0 = 150;
M0 = 0;
S0 = N - E0 - M0; % Esto se saca del enunciado.
m = 1.8;
c = 0.001;

dM = m*(N - S0*exp(-c/m*M) - M);

end