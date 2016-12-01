clear all
close all
clc

% 4.1
% Notar que la E.D.O es stiff
dy = @(t, y) 100*(1 - y);
ts = [0, 5];
y0 = 2;
options = odeset('AbsTol', 1e-6, 'RelTol', 1e-4);

[t1, y1] = ode45(dy, ts, y0, options);
[t2, y2] = ode15s(dy, ts, y0, options);

% Cantidad de Subintervalos generados por los metodos
fprintf('Subintervalos ode45: '); disp(length(t1) - 1)
fprintf('Subintervalos ode15s: '); disp(length(t2) - 1)

% 4.2
figure(1)
plot(t2, exp(-100*t2)+1, 'k'); grid on
axis equal
figure(2)
plot(t1(1:end-1), t1(2:end) - t1(1:end-1), 'b');grid on; hold on;
plot(t2(1:end-1), t2(2:end) - t2(1:end-1), 'r')
legend('Pasos ode45', 'Pasos ode15s')