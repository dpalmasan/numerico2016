% pregunta 1, laboratorio 4, 521230, 2015-1
reps = 100;
nvalues = [25 50 100 200 400 800];
counterAfull = zeros(length(nvalues),1);
counterAsparse = zeros(length(nvalues),1);								
% multiplicar A por si misma, como full y como sparse, 
% comparar tiempos de ejecucion
for j = 1:length(nvalues)			
    counterAnfull = zeros(reps,1);
    counterAnsparse = zeros(reps,1);
    A = matriz_preg1_lab4(nvalues(j),4,2,2,7);
    B = sparse(A);
    for i = 1:reps
        % multiplicar A por si misma como matriz full
        % en counterAfull(i) se almacena tiempo transcurrido
        tic
        B1 = A*A;
        counterAnfull(i)=toc;
        
        % multiplicar A por si misma como matriz sparse
        % en counterAsparse(i) se almacena tiempo transcurrido
        tic
        B2 = B*B;
        counterAnsparse(i)=toc;
    end
    counterAfull(j) = sum(counterAnfull)/reps;
    counterAsparse(j) = sum(counterAnsparse)/reps;
end
loglog(nvalues,counterAfull,'o-')
hold on
loglog(nvalues,counterAsparse,'*-')
legend('A full','A sparse');
xlabel('n');
ylabel('tiempo transcurrido para calcular A^2');