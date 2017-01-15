function L = cholesky(A)
% Calcula una factorizacion A = LL' con el metodo del Cholesky
% Funcion basada en el algoritmo de la factorizacion de Cholesky dado en 
% las diapositivas del curso (Calculo Numerico UDEC - sistemas de
% ecuaciones III).
%
% Entradas:
% -----------------------------------------------------------------------
% A: Debe ser una matriz cuadrada, simetrica y definida positiva
%
% Salidas:
% -----------------------------------------------------------------------
% L: Es una matriz triangular inferior tal que A = L*L'
%
% Ejemplo de uso:
% L = cholesky([4, 6, 8; 6, 10, 16;8, 16, 36])

[m, n] = size(A);

if m ~= n
    error('Matriz no es cuadrada')
end

if norm(A - A') > 1e-3
    error('Matriz no es simetrica')
end

if ~all(eig(A) > 0)
    error('Matriz no es definida positiva')
end

L = zeros(n);

for j = 1:n
    L(j, j) = sqrt(A(j, j) - sum(L(j, 1:(j-1)).^2));
    for i = j+1:n
        L(i, j) = 1/L(j, j)*(A(i, j) - sum(L(i, 1:(j-1)).*L(j, 1:(j-1))));
    end
end

end