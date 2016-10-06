function [aprox_e, k] = aproximar_e(delta)

real_e = exp(1);
aprox_e = 1;

k = 0;
while (real_e - aprox_e) > delta
    k = k + 1;
    aprox_e = aprox_e + 1/prod(1:k);
end
end