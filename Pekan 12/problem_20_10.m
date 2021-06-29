F = @(x) 1.6.*x-0.045.*x.^2; % fungsi gaya (Force)
theta = @(x) -0.00055.*x.^3+0.0123.*x.^2+0.13.*x; % fungsi sudut
Work = integral(@(x) F(x).*cos(theta(x)), 0, 30) % Kerja = integral(F(x)*cos(x)dx)
% Output: Work = -158.0871