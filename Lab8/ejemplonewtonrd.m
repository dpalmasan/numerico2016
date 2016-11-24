% preg 2, lab 8, 521230, S1-2015

% raices de F son los pares (x,x^2) con x raiz del polinomio 
% x^4 + x^3 + x^2 - 1
x = roots([1 1 1 0 -1])
y = x.^2

x0 = [1/4;1/4]; % converge a (0.6823,(0.6823)^2) en 6 iteraciones

[sol,it] = newtonrd('Fxy','dFxy',x0,1e-10,30);
if it > -1
    display('numero de iteraciones para obtener precision deseada')
    it
    display('aproximacion a cero de f')
    sol
else
    display('metodo no obtuvo precision deseada en maximo de iteraciones dado')
end

% Agregamos llamados utilizando los siguientes puntos
fprintf('---------------------\n')
fprintf('Tabla de Datos\n')
fprintf('---------------------\n')
fprintf('(x0, y0) \t\t Iteraciones \t Aproximacion a 0\n')
for n = [-5, -1, 1, 2]
    x0 = [1/n;1/n];
    [sol,it] = newtonrd('Fxy','dFxy',x0,1e-10,30);
    fprintf('(%1.2f, %1.2f) \t\t %3d \t\t (%1.4f %1.4f) \n', ...
        x0(1), x0(2), it, sol(1), sol(2));
end