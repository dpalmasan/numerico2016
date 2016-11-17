function I = simpson(f, a, b, N)
% Implementa la regla de Simpson.
% ----------------------------------------
% Sintaxis
%
% f   : Funcion a integrar (se pasa como funcion anonima)
% a, b: Intervalo de integracion [a, b]
% N   : La cantidad de subintervalos a considerar.

h = (b - a)/(2*N);
x = a + (0:2*N)*h;

xp = x(2:2:end-1);
xi = x(3:2:end-2);

I = h/3 * ( f(a) + f(b) + 4*sum(f(xp)) + 2*sum(f(xi)));

end