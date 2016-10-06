clear all
close all
clc

A = create_trid(10, 4, 1, 1);

% Solo para que se vea bonito en consola :P
fprintf('-----------------------------------\n');

% Verificar si es invertible
if rank(A) == size(A, 1)
    fprintf('La matriz es invertible\n');
else
    fprintf('La matriz no es invertible\n');
end

% Generar vector aleatorio de 10 componentes
d = rand(10, 1);

% Solucion con comando visto en labs 1 y 2
x = A\d;

% Solucion del sistema con factorizacion LU
[L, U, P] = lu(A);

xlu = U \ (L \ (P*d));

% Se obtiene la misma solucion.
fprintf('Norma de |x - xlu|: %e\n', norm(x - xlu));
fprintf('-----------------------------------\n');