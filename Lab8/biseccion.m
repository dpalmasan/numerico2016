function [r,it] = biseccion(f,a,b,tol)
% Metodo de biseccion para encontrar cero de una funcion en [a,b]
% la funcion debe ser tal que f(a)f(b) < 0
% el metodo de biseccion genera subintervalos cada vez mas pequennos
% que contienen el cero de f, el metodo parara cuando la longitud del
% ultimo subintervalo generado sea menor o igual que tol y dara el punto
% medio de ese subintervalo como aproximacion a la raiz de f
% Entrada: f, a, b, tol
% Salida: aproximacion al cero de la funcion y numero de iteraciones
% necesarias para llegar a ella con la precision requerida
% Ejemplo de uso:
% xr = biseccion(@(x) x^3 - cos(x), 0, 1, 1e-6)

% extremos del intervalo
xinf = a;
xsup = b;    

% valor de f en extremo inferior del intervalo
finf = feval(f,xinf);

% esta variable se inicializa a 0, ella tomara el valor 1 si en algun
% momento del metodo de biseccion el punto medio del subintervalo
% considerado es cero de f
encontrocero = 0;

% contador del numero de iteraciones del metodo
it = 0;

% el metodo iterara mientras el tamanno del intervalo donde se encuentra un
% cero de f sea mayor que tol y no se encuentre el cero
while (xsup-xinf > tol) && ~encontrocero
    % punto medio del intervalo
    xmedio = (xinf+xsup)/2;
    it = it + 1;
    % valor de f en punto medio
    fmedio = feval(f,xmedio);
    if fmedio*finf == 0
        % xmedio es cero de f, debe pararse iteracion
        encontrocero = 1;
        % xmedio es cero
        r = xmedio;
    elseif fmedio*finf < 0
        % cambiar intervalo de busqueda
        xsup = xmedio;
    else
        % cambiar intervalo de busqueda
        xinf = xmedio;
        finf = fmedio;
    end
end

% si ninguno de los puntos medios generados fue cero de f, se toma el punto
% medio del ultimo intervalo de busqueda como aproximacion al cero de f
if ~encontrocero
    r = (xsup + xinf)/2;
end

end