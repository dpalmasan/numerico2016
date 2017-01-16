function x = MEG(A, b)
% Implementa el Metodo de Eliminacion Gaussiana, basado en el algoritmo
% dado en las diapositivas del curso (sistemas lineales II), calculo
% numerico, UDEC.
% Entradas:
% ------------------------------------------------------------------------
% A: Matriz que representa el sistema de ecuaciones de nxn
% b: Miembro derecho del sistema
%
% Salida:
% ------------------------------------------------------------------------
% x: Solucion del sistema A*x = b
%
% TODO:
% - Ver si es posible vectorizar algunas operaciones, para tener una
% implementacion mas eficiente
% - Agregar chequeos necesarios (que A sea matriz de nxn, que las
% dimensiones de b coincidan, etc.
% - Agregar mensaje de error si se da el caso de necesidad de pivoteo.

n = size(A, 1);

% Triangularizar
for k = 1:n-1
    for i = (k+1):n
        mik = A(i, k)/A(k, k);
        for j = (k+1):n
            A(i, j) = A(i, j) - mik*A(k, j);
        end
        b(i) = b(i) - mik*b(k);
    end
end

% Sustitucion regresiva
x = zeros(n, 1);
for i = n:-1:1
    x(i) = 1/A(i, i) * (b(i) - A(i, (i+1):n)*x((i+1):n));
end

end