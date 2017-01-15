function s = spline_natural(x, y, xx)
% Interpola pares de datos definidos por vectores x e y, y los evalua en un
% conjunto de puntos xx, utilizando spline cubica natural vista en clases.
% Esta funcion esta basada en el algoritmo visto en el capitulo de
% interpolacion del curso calculo numerico, UDEC.
% Entradas
% -------------------------------------------------------------------------
% x: Eje de las abscisas (puntos a interpolar)
% y: Eje de las ordenadas (puntos a interpolar)
% xx: Puntos a evaluar la interpolacion encontrada
%
% Salidas
%--------------------------------------------------------------------------
% s: La spline evaluada en los puntos xx.
%
% TODO:
% -------------------------------------------------------------------------
% - Vectorizar algunos calculos para realizarlos de forma eficiente.
% - Modificar codigo para que sea mas legible.
% - Modificar el calculo de la spline construida con funciones anonimas.

% Pasar a vectores columnas
x = x(:);
y = y(:);

% Hay n + 1 puntos (x0, x1, ..., xn)
n = length(x) - 1;

% TODO: Optimizar estos calculos
h = zeros(n, 1);
for k = 1:n
    h(k) = x(k + 1) - x(k);
end

% Calculos de vectores a, b, d
a = zeros(n - 1, 1);
d = zeros(n - 1, 1);
b = zeros(n - 2, 1);

for k = 2:n
    a(k - 1) = 2*(h(k) + h(k - 1));
    d(k - 1) = (y(k + 1) - y(k))/h(k) - (y(k) - y(k - 1))/h(k - 1);
end

for k = 2:n-1
    b(k - 1) = h(k - 1);
end

% Spline cubica natural, calculo de sigmas
sigma = [0; (diag(a) + diag(b, -1) + diag(b, 1)) \ (6*d); 0];

% Calcular polinomios por tramos
q = cell(n, 1);

for k = 1:n
    q{k} = @(z) sigma(k)/6* ((x(k + 1) - z).^3/h(k) - h(k)*(x(k + 1) - z)) ...
        + sigma(k + 1)/6*((z - x(k)).^3/h(k) - h(k)*(z - x(k))) + ...
        y(k)*(x(k + 1) - z)/h(k) + y(k + 1)*(z - x(k))/h(k);
end

% Evaluar el polinomio por tramos y retornar
N = length(xx);
s = zeros(size(xx));

for i = 1:N
    % Buscar indice del polinomio a evaluar
    idx = find(xx(i) <= x, 1, 'first');
    idx = idx - 1;
    if idx == 0
        idx = 1;
    end
    s(i) = q{idx}(xx(i));
end

end