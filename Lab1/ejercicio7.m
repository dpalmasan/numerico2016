clear all
close all
clc
 
% Valor de n, puede modificarlo para testear
n = 1135;
 
% Guarde sus resultados en la variable suma
% NO USAR CICLOS ;)
suma = sum(unique([3:3:n, 5:5:n]));
 
% Mostrar resultados
disp('suma =')
disp(suma)