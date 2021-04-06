function Rxp = rot(k, theta)
%Ref Eqn 2.2
%   Rot(k, theta)
% k = cross(kB, kA);  % v
% theta = atan2d(norm(k), dot(kB, kA));
% k = k/norm(k);

kx = k(1);
ky = k(2);
kz = k(3);

vers_theta = 1 - cosd(theta);
Rxp = [kx * kx * vers_theta + cosd(theta)        ky * kx * vers_theta - kz * sind(theta)    kz * kx * vers_theta + ky * sind(theta); ...
       kx * ky * vers_theta + kz * sind(theta)   ky * ky * vers_theta + cosd(theta)         kz * ky * vers_theta - kx * sind(theta); ...
       kx * kz * vers_theta - ky * sind(theta)   ky * kz * vers_theta + kx * sind(theta)    kz * kz * vers_theta + cosd(theta)];
end

