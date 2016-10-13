function [] = mostrarrangos(x,G,U,titulo)
% crea un codigo de barra con las 10 paginas mas importantes
% segun google
% Entrada: vector con rangos de paginas
% G es la matriz de incidencia de google, G(i,j) es 1 si en la pagina j
% hay un enlace a la pagina i
% U es un arreglo con los nombres de las paginas

G = G - diag(diag(G));
  
% c = numero de enlaces en una pagina, r = numero de enlaces a una pagina

[m,n] = size(G);
c = full(sum(G,1));
r = full(sum(G,2));

% escalar x

x = x/sum(x);

% ordenar x en forma descendiente, asi los primeros elementos seran los de
% mayor pagerank

[ignore,q] = sort(x,1,'descend');

% Grafico de barras de las n paginas con mayor pagerank

n = 10;
shg
bar(x(q(1:n)))
title(titulo)

% Imprimir nombres de las n paginas con mayor pagerank.

disp('     page-rank  hacia en  url')
k = 1;
while (k <= n) 
    j = q(k);
    fprintf(' %3.0f %8.4f %4.0f %4.0f  %s\n', ...
        j,x(j),r(j),c(j),U{j})
    k = k+1;
end
