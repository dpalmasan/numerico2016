function T = ejercicio1_temp(t, k)
% Funcion del ejercicio 1, para evaluar T(t) con kappa dado por parametro.
% Esta funcion se utilizara de manera auxiliar para simplificar el codigo.
% Si se quiere ver una solucion mas simple, entrar a mi web, en la seccion
% de tips del Lab 8: www.udec.cl/~dipalma/ayudantias/numerico/
% La funcion asumira que kappa puede ser un vector, en tal caso t estara
% fijo, por ello se ponen los puntos en operaciones con k.
T = (10.2 + 1./(2*k)).*exp(-k*(t - 20)) + (t + 24)/2 - 1./(2*k);
end