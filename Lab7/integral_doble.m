function I = integral_doble(f, a, b, c, d, N)
% Implementa la integral doble del ejercicio 3, del laboratorio de calculo
% numerico, 2016. www.udec.cl/~dipalma
% -------------------------------------------------------------------------
% Sintaxis
%
% f          : Funcion a integrar (se pasa como funcion anonima)
% a, b, c, d : Intervalos de integracion [a, b] x [c, d]
% N          : La cantidad de subintervalos a considerar.
F = @(x) arrayfun(@(x) trap(@(y) f(x, y), c, d, N), x);
I = simpson(@(x) F(x), a, b, N);

end