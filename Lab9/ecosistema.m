function dx = ecosistema(t, x, alfa)
% Funcion utilizada para el ejercicio 2 del lab 9 de calculo numerico.
% Cambiaremos los nombres de las variables x(1) seran los conejos y x(2)
% seran los zorros. Notar que utilizaremos alfa como parametro adicional,
% para no escribir mas funciones en caso de cambiar el valor de alfa.

% La funcion que defina al P.V.I debe retornar un vector columna
dx = zeros(2, 1);

% Ecuacion 1
dx(1) = 2*x(1) - alfa*x(1)*x(2);
dx(2) = -x(2) + alfa*x(1)*x(2);

end