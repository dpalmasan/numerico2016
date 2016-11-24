clear all
close all
clc

% Practicando inline
f = inline('(x + cos(x.^2))./log(1 + exp(x.^2))');

% Para df utilizaremos funcion anonima, notese que no usaremos . para
% operaciones, pues evaluaremos con arrayfun
df = @(x) ((1 - 2*x*sin(x^2)) * log(1 + exp(x^2)) - (x + cos(x^2))* ...
    (2*x*exp(x^2))/(1 + exp(x^2))) / (log(1 + exp(x^2)))^2;


% Para graficar
x = linspace(-5, 5, 200);

plot(x, f(x), 'b'); hold on; grid on
plot(x, arrayfun(df, x), 'r')
legend('f', 'derivada de f')

% Buscamos los puntos criticos en los minimos y maximos absolutos (que
% sacamos de la grafica
xmin = fzero(df, -2);
xmax = fzero(df, 0);

% Usamos feval para evaluar f, pues es inline
fprintf('Minimo y maximo'); disp([feval(f, xmin), feval(f, xmax)])

