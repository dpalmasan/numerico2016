clear all
close all
clc

% 5.1
dx = @(t, x) -3*t*x^2 + 1/(1 + t^3);

ts = [0, 5];
x0 = 0;

% Mostrar en consola la tabla :P
fprintf('RelTol\t AbsTol\t\t max...\n')
for k = 2:5
    relTol = 10^(-k);
    absTol = 10^-(k + 2);
    options = odeset('RelTol', relTol, 'AbsTol', absTol);
    
    [t, x] = ode45(dx, ts, x0, options);
    
    % Sol exacta
    xe = t./(1 + t.^3);
    fprintf('%.0e \t %.0e \t %1.4f\n', relTol, absTol, max(abs(x - xe)));
end

% Copy-paste del pdf
figure(1)
plot(t,t./(1+t.^3))
figure(2)
plot(t(1:end-1),t(2:end)-t(1:end-1))
