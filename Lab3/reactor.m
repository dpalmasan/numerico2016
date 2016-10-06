function [A, b] = reactor(W, S, n, m, xin, yin)

% Leyendo el enunciado se llega a lo siguiente (por favor verificarlo con
% lapiz y papel
A = create_trid(n, -(W + S*m), S*m, W);
b = [-W*xin; zeros(n-2, 1); -S*yin];
end