function [coef, est] = funcion_test1_tema3(t, f, alfa)

% Matriz del problema (asumiendo que t y f entran como vectores columna)
A = [ones(length(t), 1), t, t.^2, exp(alfa*t)];
b = f;

% Obtener coeficientes
coef = A \ b;

% Estimacion
est = 0.4 * norm(A*coef - b) + 0.6*abs(20 - coef(1) - coef(4));

end

