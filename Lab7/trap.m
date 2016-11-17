function I = trap(f, a, b, N)
% Implementa la regla de trapecios.
% ----------------------------------------
% Sintaxis
%
% f   : Funcion a integrar (se pasa como funcion anonima)
% a, b: Intervalo de integracion [a, b]
% N   : La cantidad de subintervalos a considerar.

h = (b - a)/N;
xi = a + (0:N)*h;

I = h * ( (f(a) + f(b))/2 + sum(f(xi(2:end-1))));

end