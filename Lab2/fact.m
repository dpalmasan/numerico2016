function v = fact(n)

% El chequeo mas facil es verificar que la entrada sea mayor o igual a 0.
% Opcional y no se pide en el ejercicio.
if n < 0
    error('n no puede ser negativo!')
end

% Otro chequeo que podria hacerse es que n sea natural (Opcional, no se
% pide en el ejercicio
if rem(n, 1) ~= 0
    error('n debe ser un natural!')
end

% Tambien podriamos hacer que la funcion no acepte vectores o matrices
if ~all(size(n) == [1, 1])
    error('n debe ser un escalar!')
end

% Podrian hacerse mas chequeos, pero no es la gracia del ejercicio.

% Una solucion posible
v = 1;
i = 2;
while i <= n
    v = i*v;
    i = i + 1;
end

% Solucion alternativa 1
% v = 1;
% for i = 2:n
%     v = i*v;
% end

% Solucion alternativa 2 (Recursiva)
% if n == 0 || n == 1
%     v = 1;
% else
%     v = n*fact(n - 1);
% end

% Solucion alternativa 3
% v = prod(2:n);

end