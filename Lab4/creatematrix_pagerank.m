function A = creatematrix_pagerank(G)
% crear, a partir de matriz de incidencia de la web,
% matriz de sistema de ecuaciones a resolver para
% encontrar la "importancia" de cada pagina web
% entrada: matriz G con informacion acerca de enlaces en las distintas
% paginas de la web (en nuestro caso consideramos solo 497 paginas)

p = 0.85;

% eliminar enlaces de una pagina a si misma

G = G - diag(diag(G));
  
% c = numero de enlaces en una pagina, r = numero de enlaces a una pagina

[m,n] = size(G);
c = sum(G,1);
r = sum(G,2);

% crear matriz diagonal que, por cada pagina, contiene el numero de enlaces
% en ella

k = find(c~=0);
D = sparse(k,k,1./c(k),n,n);

I = speye(n);

% matriz de sistema de ecuaciones a resolver para encontrar pagerank
% de paginas

A = (I - p*G*D);