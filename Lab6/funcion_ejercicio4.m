function s = funcion_ejercicio4(v)
% Funcion del Laboratorio 6, ejercicio 4. Devuelve la spline, que interpola
% los puntos de la tabla 2, evaluada en v.

x = 0:.5:10;
y = [2.5, 2.8, 3, 3.3, 3.8, 4.8, 4.8, 5, 4.8, 4.7, 4.7, 4.5, 4.5, ...
    4.4, 4.3, 4.4, 4.2, 4, 4.1, 4.3, 3.5];
s = spline(x, y, v);
end