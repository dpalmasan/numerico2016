clear all
close all
clc

% Para ver detalles de como usar "menos codigo" para resolver este
% problema, revisar la seccion de tips del lab8 de
% www.udec.cl/~dipalma/ayudantias/numerico

% 1.2
% a)
k = linspace(0.1, 0.5);
plot(k, Fkappa(k), 'b'); grid on

% b)
% El valor de kappa es 0.3310
kappa = fzero('Fkappa', [0.1, 0.5], optimset('TolX', 1e-10));

% 1.3 
% Lo haremos utilizando funciones anonimas, la funcion escrita para el
% ejercicio 1
f = @(t) ejercicio1_temp(t, kappa) - 36.5;

% Sera el t* pedido en el enunciado, como se sabe que existe solucion en el
% intervalo que nos dan, no graficaremos.
t_star = fzero(f, [16, 20], optimset('TolX', 1e-10));

% El Sr. D fue asesinado aproximadamente a las 19 horas.
% Segun los datos M no pudo ser el asesino, pues entre las 18 y las 19:20
% se encontraba en una entrevista...

