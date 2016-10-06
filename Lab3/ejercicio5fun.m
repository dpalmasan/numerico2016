function [A, b] = ejercicio5fun(h)

% Calculamos n a partir de h
n = 1/h - 1;

% Usamos la funcion del ejercicio 1
A = 1/h^2 * create_trid(n, 2, -1, -1);

% Creamos vector b
b = -4*ones(n, 1) + 1/h^2*[1;zeros(n-2,1);1];
end