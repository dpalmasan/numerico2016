function I = romberg(f, a, b, h, varargin)
% Calcula la integral de f, en el intervalo a, b, inicialmente con un
% paso h, utilizado el metodo de Romberg. El algoritmo esta basado en las
% diapositivas del curso de calculo numerico, UDEC, capitulo de integracion
% numerica II.
% TODO:
% -------------------------------------------------------------------------
% - Expandir documentacion
% - Agregar parametros adicionales (por ejemplo error requerido, orden
% maximo a considerar).
% - Agregar chequeo de errores.

% Valor por defecto
n = 5;

% Inicializar tabla
tabla = zeros(n);

% Inicializacion
for i = 1:n
    step = h/2^(i - 1);
    tabla(i, 1) = trapecios(f, a, b, step);
end     

% Calcular aproximaciones y generar la tabla
for j = 2:n
    for i = j:n
        delta = (tabla(i, j - 1) - tabla(i - 1, j - 1))/(2^((j - 1)*2) - 1);
        tabla(i, j) =  tabla(i, j - 1) + delta;
    end
end

% Se retorna el ultimo elemento de la tabla (mayor orden)
I = tabla(n, n);
end

function I = trapecios(f, a, b, h)
% Funcion auxiliar, utilizada para calcular la integral de f, en el
% intervalo [a, b] utilizando la regla de trapecios con paso h.
n = ceil((b - a)/h);
xi = a + (0:n)*h;
I = h * (0.5*(f(a) + f(b)) + sum(f(xi(2:end-1))));

end