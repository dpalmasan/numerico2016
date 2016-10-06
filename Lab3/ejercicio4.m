clear all
close all
clc

% Tabular de forma relativamente elegante :P
fprintf('cond \t\t\t\t condest\n');
fprintf('-----------------------------------\n');
for n = 2:10
    H = hilb(n);
    fprintf('%e \t\t %e\n', cond(H), condest(H));
end
fprintf('-----------------------------------\n\n');

% Copy-paste del vector del pdf ;) like a pro
b0 = [ 
    0.7487192;
    0.4407175;
    0.3206968;
    0.2543113;
    0.2115308;
    0.1814429
    ];

% Perturbaciones aleatorias
delta_b = (2*rand(6,1)-1)*1e-6;

% Simplemene leer y seguir las instrucciones
b1 = b0 + delta_b;

H6 = hilb(6);
x0 = H6 \ b0;
x1 = H6 \ b1;

delta_x = x1 - x0;

% Mostrar valores para comparar (Observar la diferencia en las soluciones
% frente a variaciones pequenhas de b!
disp(delta_x)
disp(delta_b)

% Mostrar valor de la cota (se satisface la relacion)
disp(norm(delta_x)/norm(x0) <= cond(H6)*norm(delta_b)/norm(b0))