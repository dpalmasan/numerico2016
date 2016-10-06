function G = mifuncion2(x)
% funcion para evaluar f(x) = 2sin^2(x/2)/x^2 en cada
% una de las componentes del vector de entrada x

n = length(x);

% Inicializar vector de salida
G = zeros(n,1);

% ciclo para evaluar g en componentes de x
for i=1:n
    
    % averiguar si componente i-esima de v es distinta de cero
    if x(i) ~= 0
        G(i) = 2*sin(x(i)/2)^2/x(i)^2;
    else
        G(i) = 1/2;
    end
end

end