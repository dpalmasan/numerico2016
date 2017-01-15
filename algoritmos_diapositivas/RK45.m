function [xs, ys] = RK45(f, tspan, y0, varargin)
% Implementa el metodo RK45 basado en las diapositivas del curso, calculo
% numerico, UDEC, capitulo de E.D.O I.
% ------------------------------------------------------------------------
% TODO:
% - Modificar valores por defecto
% - Chequeo de argumentos adicionales y modificar valores de estos
% parametros.
% - Ajustar de manera de obtener la solucion dentro de [a, b]
% - Observar que el epsilon debe ser pequeno (Buscar valor optimo para
% dejar por defecto.
% - Chequear si es mas eficiente aumentar el tamano del vector en 2 en cada
% iteracion, o dejar que matlab haga memory preallocation

% Valores por defecto requeridos por el algoritmo
epsilon = 1e-12;
h = 1e-3;

% Asignar limites en el intervalo de solucion
a = tspan(1);
b = tspan(2);

% Inicializar variables
n = 2;
xs = zeros(n, 1);
ys = zeros(n, 1);
xs(1) = a;
ys(1) = y0;

% Inicializar Ciclo While
fin = false;
i = 1;
while ~fin
    xs(i + 1) = xs(i) + h;
    k1 = h*f(xs(i), ys(i));
    k2 = h*f(xs(i) + 0.25*h, ys(i) + 0.25*k1);
    k3 = h*f(xs(i) + 3/8*h, ys(i) + 3/32*k1 + 9/32*k2);
    k4 = h*f(xs(i) + 12/13*h, ys(i) + 1932/2197*k1 - 7200/2197*k2 + 7296/2197*k3);
    k5 = h*f(xs(i) + h, ys(i) + 439/216*k1 - 8*k2 + 3680/513*k3 - 845/4104*k4);
    k6 = h*f(xs(i) + 0.5*h, ys(i) - 8/27*k1 + 2*k2 - 3544/2565*k3 + 1859/4104*k4 - 11/40*k5);
    ys(i + 1) = ys(i) + 25/216*k1 + 1408/2565*k3 + 2197/4104*k4 - 1/5*k5;
    tau = 1/360*k1 - 128/4275*k3 - 2197/75240*k4 + 1/50*k5 + 2/55*k6;
    s = 0.84*(epsilon/abs(tau))^0.25;
    if abs(tau) < epsilon
        h = 2*s*h;
    else
        h = s*h;
    end
    fin = xs(i + 1) >= b;
    i = i + 1;
    
    % Se agranda vector acorde a necesidades, para evitar pedir memoria en
    % cada iteracion
    if i >= n
        xs = grow_array(xs, n);
        ys = grow_array(ys, n);
        n = 2*n;
    end
end
xs = xs(1:(i));
ys = ys(1:(i));

end

function y = grow_array(x, n)
% Funcion para duplicar tamano de un vector (Para evitar aumentar el tamano
% en cada iteracion de la funcion principal
y = zeros(2*n, 1);
y(1:n) = x;
end