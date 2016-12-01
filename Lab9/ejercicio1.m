clear all
close all
clc

% Parametros (Copy-paste pues se usaran en el ejercicio)
N = 3000;
E0 = 150;
M0 = 0;
S0 = N - E0 - M0; % Esto se saca del enunciado.
m = 1.8;
c = 0.001;

% Intervalo de solucion deseado
tspan = [0, 10];

% Opciones deseadas para ode.
options = odeset('AbsTol', 1e-8, 'RelTol', 1e-4);

% Resolver P.V.I numericamente
[t, M] = ode45('epidemia', tspan, M0, options);

% Con la solucion obtenida, calculamos las personas sanas y enfermas a lo
% largo del tiempo
S = S0*exp(-c/m*M);
E = N - S - M;

% Graficamos
plot(t, S, 'r', t, M, 'g', t, E, 'b'); grid on
xlabel('tiempo [Semanas]'); ylabel('Cantidad de Personas')
legend('Sanos', 'Muertos', 'Enfermos')

% 1.3 Del grafico, aproximadamente en 8 semanas se llega al estado
% estacionario.

% 1.4 Utilizaremos deval para esto (ver tips del lab en mi web)
% www.udec.cl/~dipalma/ayudantias/numerico

% En este caso, se retornara una "funcion" que evalua la solucion del P.V.I
% Por favor, notar que en este caso se pasa la funcion por "referencia"
% (utilizando @), si no, no se obtiene lo deseado
Mf = ode45(@epidemia, tspan, M0, options);

% Cantidad de personas muertas al cabo de 8 semanas (utilizamos deval para
% evaluar la "funcion" obtenida como solucion.
deval(Mf, 8)