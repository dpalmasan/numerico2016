clear all
close all
clc

% Variables que serviran para calcular los tiempos promedios
t1p = 0;
t2p = 0;

for k = 1:20
    [t1, t2, normaerror] = variossistemas;
    t1p = t1p + t1;
    t2p = t2p + t2;
end

t1p = t1p / 20;
t2p = t2p / 20;

fprintf('-------------------------------------------------------------\n');
fprintf('tiempo promedio usando \\: %f\n', t1p);
fprintf('tiempo promedio usando ciclos: %f\n', t2p);
fprintf('-------------------------------------------------------------\n');