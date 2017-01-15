function [x, it, conv] = maximo_descenso(A, b, varargin)
% Calcula la solucion del sistema de ecuaciones lineal A*x = b, utilizando
% el metodo del maximo descenso.
% Funcion basada en el algoritmo del maximo descenso dado en las
% diapositivas del curso (Calculo Numerico UDEC - sistemas de
% ecuaciones lineales VI).
%
% Entradas:
% -----------------------------------------------------------------------
% A: Debe ser una matriz cuadrada, simetrica y definida positiva
% b: Miembro derecho del sistema de ecuaciones (debe ser un vector columna)
% x0 (opcional): Vector inicial para aplicar el metodo, por defecto se
% considera el vector nulo.
% tol (opcional): La tolerancia a considerar, por defecto se considera una
% tolerancia de 1e-6.
% maxit (opcional): Cantidad maxima de iteraciones a permitir.
%
% Salidas:
% -----------------------------------------------------------------------
% L: Es una matriz triangular inferior tal que A = L*L'
%
% Ejemplo de uso:
% L = cholesky([4, 6, 8; 6, 10, 16;8, 16, 36])

% Calcular dimensiones
[m, n] = size(A);

% Primer chequeo
if m ~= n
    error('Matriz no es cuadrada')
end

if norm(A - A') > 1e-3
    error('Matriz no es simetrica')
end

if ~all(eig(A) > 0)
    error('Matriz no es definida positiva')
end

% Valores por defecto
x0 = zeros(n, 1);
tol = 1e-6;
maxit = 100;

if nargin > 5
    error('Cantidad de argumentos incorrecta')
end

if nargin >= 3
    x0 = varargin{1};
    if nargin >= 4
        tol = varargin{2};
        if nargin >= 5
            tol = varargin{3};
        end
    end
end

r = b - A*x0;
conv = false;
it = 0;
while ~conv && it < maxit
    alfa = r'*r/((A*r)'*r);
    x = x0 + alfa*r;
    r = r - alfa*A*r;
    conv = norm(r)/norm(b) <= tol;
    x0 = x;
end
end