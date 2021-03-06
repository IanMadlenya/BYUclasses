function F = rhs10_3a(t, u)
% right-hand side function for Matlab's ordinary
% differential equation solvers: Driven Pendulum problem with damping
%
% th1' = w1
% th2' = w2
% w1' = -w0^2 * th1 - wc^2 * (th1 - th2)
% w2' = -w0^2 * th2 - wc^2 * (th2 - th1) -gamma*w2
%
%
%
% u(1) -> th1
% u(2) -> th2
% u(3) -> w1
% u(4) -> w2

global w0 wc gam N1

F = zeros(length(u), 1);

F(1) = u(3);
F(2) = u(4);
F(3) = -w0 ^ 2 * u(1) - wc ^ 2 * (u(1) - u(2)) - gam * u(3);
F(4) = -w0 ^ 2 * u(2) - wc ^ 2 * (u(2) - u(1)) - gam * u(4);

if u(1) > 0 && u(3) < 0
    F(3) = F(3) + N1;  % We think we should be checking u(1)/u(3) and changing F(3)
end

if u(2) > 0 && u(4) < 0
    F(4) = F(4) + N1;
end
