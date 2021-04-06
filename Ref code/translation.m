function Px = translation(A1, A2, B1, B2, Rx)
%Ref Eqn 4.7
%   Detailed explanation goes here
RA1 = A1(1:3, 1:3);
RA2 = A2(1:3, 1:3);

PA1 = A1(1:3, end);
PA2 = A2(1:3, end);

PB1 = B1(1:3, end);
PB2 = B2(1:3, end);

E = [RA1 - eye(3); ...
     RA2 - eye(3)];
F = [Rx * PB1 - PA1;...
     Rx * PB2 - PA2];

% Px = inv(E' * E) * E' * F;
Px = E\F;
end

