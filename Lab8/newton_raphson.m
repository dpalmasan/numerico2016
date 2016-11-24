function [xr, iter, conv] = newton_raphson(f, df, x0, tol, maxit)
% Encuentra una raiz aplicando el metodo de Newton-Raphson.
% ----------------------------------------------------------
% Entradas:
% f     : La función a la cual se le quiere encontrar la raiz (funcion
% anonima, inline, funcion)
% df    : Es la derivda de f (funcion anonima, inline, funcion)
% x0    : Es el punto inicial en la busqueda de la solucion
% tol   : Es la tolerancia deseada, |xk1 - xk| <= tol
% maxit : Es la cantidad maxima de iteraciones a realizar
% Salidas
% xr    : Es la raiz encontrada
% iter  : Es la cantidad de iteraciones a utilizar
% conv  : Es un flag que vale 0 si no converge y 1 si el metodo converge
% ------------------------------------------------------------
% Ejemplo de uso: 
% xr = newton_rapson(@(x) x^3 - cos(x), @(x) 3*x^2 + sin(x), 1, 1e-6, 100) 

% Notar que usamos feval en caso de que se le pase una funcion por nombre,
% por ejemplo newton_raphson('mi_funcion' ,...)

% Chequeamos si la derivada es 0 en el punto dado
if feval(df, x0) == 0
    error('Existe un punto singular para la derivada de f')
end

% Primera iteracion
xk = x0 - feval(f, x0)/feval(df, x0);
iter = 1;

% Criterio de convergencia
conv = abs(xk - x0) <= tol;

% Iterar hasta converger
while ~conv && (iter <= maxit)
    x0 = xk;
    
    if feval(df, x0) == 0
        error('Existe un punto singular para la derivada de f')
    end

    xk = x0 - feval(f, x0)/feval(df, x0);
    conv = abs(xk - x0) < tol;
    iter = iter + 1;
end

xr = xk;

end