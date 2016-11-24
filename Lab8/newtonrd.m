function [sol,it] = newtonrd(f,df,x0,tol,maxit)
% laboratorio 8, calculo numerico (521230), S1, 2015
% metodo de newton para aproximar cero de f.
% parametros de entrada son:
% f,df: funcion, cuyo cero desea aproximarse y su derivada
% x0: aproximacion inicial a cero de f
% tol: exactitud requerida
% maxit: numero maximo de iteraciones a realizar por el metodo

J0 = feval(df,x0);
f0 = feval(f,x0);
if det(J0) == 0
    error('determinante de jacobiano igual a cero')
end
d0 = J0\(-f0);
x1 = x0 + d0;
it = 1;
conv = norm(d0) <= tol;
while ~conv && (it < maxit)
    x0 = x1;
    J0 = feval(df,x0);
    f0 = feval(f,x0);
    d0 = J0\(-f0);
    if det(J0) == 0
        error('determinante de jacobiano igual a cero')
    end
    x1 = x0 + d0;
    conv = norm(d0) <= tol;
    it = it+1;
end
sol = x1;
if ~conv
    it = -1;
end
