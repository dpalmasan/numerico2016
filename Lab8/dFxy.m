function J = dFxy(x)
% derivada de funcion en preg2, lab 8, 521230, S1, 2015
J = zeros(2);
J(1,1) = 2*x(1) + x(2);
J(1,2) = x(1) + 2*x(2);
J(2,1) = -2*x(1);
J(2,2) = 1;