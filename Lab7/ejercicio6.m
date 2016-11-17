clear all
close all
clc

% Definicion de funciones
f = @(x) ones(size(x));
g = @(x) x;

% Buscar como funciona la funcion double, para entender la logica de lo que
% hice aqui ;)
h = @(x) double(x >= -2).*double(x < 0) + ...
    x.^2.*double(x >= 0).*double(x <= 1);

% Magia, mezclando Latex con MATLAB (ver como queda el titulo jeje)
set(0,'defaulttextinterpreter','latex')

% Para f
figure;
subplot(221)
serie_fourier(f, 0, 1, 1);
title('$N = 1$', 'Interpreter', 'latex')
subplot(222)
serie_fourier(f, 0, 1, 2);
title('$N = 2$', 'Interpreter', 'latex')
subplot(223)
serie_fourier(f, 0, 1, 5);
title('$N = 5$', 'Interpreter', 'latex')
subplot(224)
serie_fourier(f, 0, 1, 10);
title('$N = 10$', 'Interpreter', 'latex')
suptitle('$f(x) = 1, \quad x \in [0, 1]$')

% Para g
figure;
subplot(221)
serie_fourier(g, -1, 2, 1);
title('$N = 1$', 'Interpreter', 'latex')
subplot(222)
serie_fourier(g, -1, 2, 2);
title('$N = 2$', 'Interpreter', 'latex')
subplot(223)
serie_fourier(g, -1, 2, 5);
title('$N = 5$', 'Interpreter', 'latex')
subplot(224)
serie_fourier(g, -1, 2, 10);
title('$N = 10$', 'Interpreter', 'latex')
suptitle('$g(x) = x, \quad x \in [-1, 2]$')

% Para h
figure;
subplot(221)
serie_fourier(h, -2, 1, 1);
title('$N = 1$', 'Interpreter', 'latex')
subplot(222)
serie_fourier(h, -2, 1, 2);
title('$N = 2$', 'Interpreter', 'latex')
subplot(223)
serie_fourier(h, -2, 1, 5);
title('$N = 5$', 'Interpreter', 'latex')
subplot(224)
serie_fourier(h, -2, 1, 10);
title('$N = 10$', 'Interpreter', 'latex')
suptitle('$h(x) = 1 \quad o \quad h(x) = x^2$')

