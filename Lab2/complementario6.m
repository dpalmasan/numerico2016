function [Tinv, p] = complementario6(T)

% Asumiremos que T es cuadrada, calculamos su dimension
n = size(T, 1);

% Verdadero si es triangular inferior
p1 = norm(tril(T) - T) == 0;

% Verdadero si es no singular
p2 = rank(T) == n;

% Verdadero si es triangular inferior y es no singular
p = p1 && p2;

% Inicializamos matriz
Tinv = zeros(n);

% Ciclo para calcular elementos de la inversa segun el algoritmo
for i = 1:n
    Tinv(i, i) = 1/T(i, i);
    for j = 1:i-1
        % Aca hacemos la sumatoria
        Tinv(i, j) = 0;
        for k = 1:i-1
            Tinv(i, j) = Tinv(i, j) - T(i, k)*Tinv(k, j);
        end
        % Dividimos la sumatoria, como dice el algoritmo
        Tinv(i, j) = Tinv(i, j)/T(i, i);
    end
    
end

end