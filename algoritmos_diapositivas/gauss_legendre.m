function I = gauss_legendre(f, a, b, n)
% Calcula la Integral de f utilizando la regla de Gauss-Legendre.
% Entradas:
% -----------------------------------------------------------------------
% f: Es una funcion anonima, por ejemplo f = @(x) exp(-x.^2);
% a: Es el limite inferior de integracion
% b: Es el limite superior de integracion
% n: Es la cantidad de nodos a utilizar.
%
% Salidas
% -----------------------------------------------------------------------
% I: Es el valor calculador para la integral
%
% TODO: 
% - Tabular los valores Ai para cada n, de esa forma hacer mas eficiente la
% implementacion
% - Editar codigo para que sea mas legible y revisar el caso de n = 1.

% Generar polinomio de legendre para n dado
p = polinomio_legendre(n);

% Calcular los nodos, seran las raices de los polinomios
x = sort(roots(sym2poly(p)));

% Calcular los pesos de la regla de integracion
A = zeros(size(x));
if n == 1
    A = 2;
else
    % Generar polinomios de lagrange e integrar para obtener pesos
    for i = 1:length(x)
        li = @(x) 1;
        for j = 1:length(x)
            if i == j
                continue
            end
            li = @(z) li(z).* (z - x(j))/(x(i) - x(j));
        end

        A(i) = quad(@(x) li(x), -1, 1);
    end
end

% Cambio de variable en caso de ser necesario y calcular con la regla
xt = @(t) (a + b)/2 + (b - a)/2*t;
ft = @(t) f(xt(t));
I = (b - a)/2 * sum(ft(x).*A);
end


function p = polinomio_legendre(n)
% Retorna n-esimo polinomio de legendre como variable simbolica.
syms x
if n == 0
    p = 1 + 0*x;
elseif n == 1
    p = x;
else
    n = n - 1;
    p = (2*n + 1)/(n + 1)*x*polinomio_legendre(n) - ...
        n/(n + 1)*polinomio_legendre(n - 1);
end

end