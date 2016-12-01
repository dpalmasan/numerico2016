clear all
close all
clc

% 2.1

% Intervalo de solucion deseado
ts = [0, 1];

% Condiciones iniciales
x0 = [100, 100];

% Notar que pasamos la funcion por referencia (con @) y el {} es para no
% modificar la configuracion interna de la funcion ode. El resto de los
% argumentos seran los argumentos de la funcion definida para el PVI, en
% este caso el valor de alfa.
[t, x] = ode45(@ecosistema, ts, x0, {}, 0);

plot(t, x(:, 1), 'r', t, x(:, 2), 'b'); grid on
legend('Conejos', 'Zorros')

% 2.2

% Intervalo de solucion deseado
ts = [0, 12];

% Condiciones iniciales
x0 = [300, 150];

% Notar que pasamos la funcion por referencia (con @) y el {} es para no
% modificar la configuracion interna de la funcion ode. El resto de los
% argumentos seran los argumentos de la funcion definida para el PVI, en
% este caso el valor de alfa.
[t, x] = ode45(@ecosistema, ts, x0, {}, 0.01);

figure;
plot(t, x(:, 1), 'r', t, x(:, 2), 'b'); grid on
legend('Conejos', 'Zorros')

% 2.3

% Intervalo de solucion deseado
ts = [0, 12];

% Condiciones iniciales
x0 = [15, 22];

% Notar que pasamos la funcion por referencia (con @) y el {} es para no
% modificar la configuracion interna de la funcion ode. El resto de los
% argumentos seran los argumentos de la funcion definida para el PVI, en
% este caso el valor de alfa.
[t, x] = ode45(@ecosistema, ts, x0, {}, 0.01);

figure;
plot(t, x(:, 1), 'r', t, x(:, 2), 'b'); grid on
legend('Conejos', 'Zorros')