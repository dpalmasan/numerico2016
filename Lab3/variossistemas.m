function[t1,t2,normadiferencia] = variossistemas
% funcion para observar importancia de re-uso de descomposicion LU

% Crear matrices que representen 100 sistemas de ecuaciones diferentes, con
% el mismo miembro A y distintos miembros b.
A = create_trid(50,.5,1,1);
B = rand(50,100);

% Computar el tiempo que demora en encontrar las soluciones de todos los
% sistemas mediante el operador \ de MATLAB
tic
X = A\B;
t1=toc;

% Inicializar vector con las soluciones
Y = zeros(50,100);

% Computar el tiempo que demora MATLAB en resolver los sistemas 1 por 1
% utilizando ciclo for
tic
for i = 1:100
    Y(:,i) = A\B(:,i);
end
t2 = toc;

normadiferencia = norm(X-Y,inf);
end
