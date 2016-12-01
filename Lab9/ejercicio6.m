clear all
close all
clc

% 6.1
% Haciendo un cambio de variable, hacemos z1 = x, z2 = y, z3 = y'
% Las ecuaciones son:
% dz1/dt = 3sin(t)z1 + 2tz2 + 1
% dz2/dt = z3
% dz3/dt = 2z1 + t^2z3 - 5z2 + e^t

% Se hara solo para la primera ecuacion:
% z1(i + 1) = z1(i) +3*h*sin(t(i + 1))z1(i + 1) + 2*t*h*z1*(i + 1) + h

N = 100;
h = 1.5/N;
t = ((1:N+1)-1)*h;

% Condiciones iniciales
z0 = [0, 2, 0];

% Vector de solucion del PVI
z = zeros(N + 1, 3);
z(1, :) = z0;
for i = 1:N
    % Sistema lineal de ecuaciones resultante del esquema de euler
    % implicito para el PVI dado
    A = [
        1 - 3*h*sin(t(i + 1)), -2*h*t(i + 1), 0;
        -h, 1, 0;
        -2*h, 5*h, 1 - h*t(i + 1)^2];
    
    b = [z(i, 1) + h; z(i, 2); z(i, 3) + h*exp(t(i + 1))];
    
    % La solucion del sistema dan los puntos de la solucion en el paso
    % siguiente
    z(i + 1, :) = (A \ b)';    
end

% Resolver con ode45 (Se le pasa el vector t para utilizar la misma
% particion anterior.
dz = @(t, z) [3*sin(t)*z(1) + 2*t*z(2) + 1; z(1); 2*z(1) + t^2*z(3) - 5*z(2) + exp(t)];
[t, zz] = ode45(dz, t, z0);

tspan = [0, 1.5];

% Graficar x
plot(t, z(:, 1), 'b'); hold on; grid on
plot(t, zz(:, 1), 'r')
legend('Euler Implicito', 'ode45')

% Graficar y
figure;
plot(t, z(:, 2), 'b'); hold on; grid on
plot(t, zz(:, 2), 'r')
legend('Euler Implicito', 'ode45')