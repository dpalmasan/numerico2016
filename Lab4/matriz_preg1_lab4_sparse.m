function AA=matriz_preg1_lab4_sparse(nn,aa,bb,cc,dd)

A = aa*ones(nn,1);
B = bb*ones(nn,1);
C = cc*ones(nn,1);
T = spdiags([C A B],-1:1,nn,nn);
D = dd*spdiags(ones(nn, 1),nn-3,nn,nn);

AA = T + D + D';
