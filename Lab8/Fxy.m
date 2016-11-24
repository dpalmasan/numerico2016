function val = Fxy(x)
% funcion en preg 2, lab 8, 521230, S1, 2015

val = zeros(2,1);
val(1) = x(1)^2 + x(1)*x(2) + x(2)^2 - 1;
val(2) = x(2) - x(1)^2;