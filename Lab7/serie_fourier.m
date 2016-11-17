function serie_fourier(f, a, b, N)

xx = linspace(a, b, 200);
SF = 0;
a0 = 2/(b - a) * quad(f, a, b);
for n = 1:N;
    an = 2/(b - a)*quad(@(x) f(x).*cos(2*pi*n*x/(b - a)), a, b);
    bn = 2/(b - a)*quad(@(x) f(x).*sin(2*pi*n*x/(b - a)), a, b);
    SF = SF + an*cos(2*pi*n*xx/(b - a)) + bn*sin(2*pi*n*xx/(b - a));
end
SF = SF + a0/2;

plot(xx, f(xx), 'r', xx, SF, 'b'); grid on
legend('Funcion', 'Serie de Fourier')

end