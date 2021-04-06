function [beta1, beta2] = calculate_beta(kA1, kA2, Rxp1, Rxp2)
%Ref Equ 4.5
%   Detailed explanation goes here
kx1 = kA1(1);
ky1 = kA1(2);
kz1 = kA1(3);

kx2 = kA2(1);
ky2 = kA2(2);
kz2 = kA2(3);

nx1 = Rxp1(1,1);
ny1 = Rxp1(2,1);
nz1 = Rxp1(3,1);
n1 = [nx1 ny1 nz1]';

ox1 = Rxp1(1,2);
oy1 = Rxp1(2,2);
oz1 = Rxp1(3,2);
o1 = [oz1 oy1 oz1]';

ax1 = Rxp1(1,3);
ay1 = Rxp1(2,3);
az1 = Rxp1(3,3);
a1 = [ax1 ay1 az1]';

nx2 = Rxp2(1,1);
ny2 = Rxp2(2,1);
nz2 = Rxp2(3,1);
n2 = [nx2 ny2 nz2]';

ox2 = Rxp2(1,2);
oy2 = Rxp2(2,2);
oz2 = Rxp2(3,2);
o2 = [oz2 oy2 oz2]';

ax2 = Rxp2(1,3);
ay2 = Rxp2(2,3);
az2 = Rxp2(3,3);
a2 = [ax2 ay2 az2]';

cross_n1_kA1 = cross(n1, kA1);
cross_n2_kA2 = cross(-n2, kA2);

A = [-nx1 + kx1 * dot(n1, kA1) cross_n1_kA1(1) nx2 - kx2 * dot(n2, kA2) cross_n2_kA2(1); ...
     -ox1 + kx1 * dot(o1, kA1) cross_n1_kA1(1) ox2 - kx2 * dot(o2, kA2) cross_n2_kA2(1); ...
     -ax1 + kx1 * dot(a1, kA1) cross_n1_kA1(1) ax2 - kx2 * dot(a2, kA2) cross_n2_kA2(1); ...
     -nx1 + ky1 * dot(n1, kA1) cross_n1_kA1(2) nx2 - ky2 * dot(n2, kA2) cross_n2_kA2(2); ...
     -ox1 + ky1 * dot(o1, kA1) cross_n1_kA1(2) ox2 - ky2 * dot(o2, kA2) cross_n2_kA2(2); ...
     -ax1 + ky1 * dot(a1, kA1) cross_n1_kA1(2) ax2 - ky2 * dot(a2, kA2) cross_n2_kA2(2); ...
     -nx1 + kz1 * dot(n1, kA1) cross_n1_kA1(3) nx2 - kz2 * dot(n2, kA2) cross_n2_kA2(3); ...
     -ox1 + kz1 * dot(o1, kA1) cross_n1_kA1(3) ox2 - kz2 * dot(o2, kA2) cross_n2_kA2(3); ...
     -ax1 + kz1 * dot(a1, kA1) cross_n1_kA1(3) ax2 - kz2 * dot(a2, kA2) cross_n2_kA2(3)];

B = [-kx2 * dot(n2, kA2) + kx1 * dot(n1, kA1); ...
     -kx2 * dot(o2, kA2) + kx1 * dot(o1, kA1); ...
     -kx2 * dot(a2, kA2) + kx1 * dot(a1, kA1); ...
     -ky2 * dot(n2, kA2) + ky1 * dot(n1, kA1); ...
     -ky2 * dot(o2, kA2) + ky1 * dot(o1, kA1); ...
     -ky2 * dot(a2, kA2) + ky1 * dot(a1, kA1); ...
     -kz2 * dot(n2, kA2) + kz1 * dot(n1, kA1); ...
     -kz2 * dot(o2, kA2) + kz1 * dot(o1, kA1); ...
     -kz2 * dot(a2, kA2) + kz1 * dot(a1, kA1)];

X = A\B;

beta1 = asind(X(2));
beta2 = asind(X(4));
end

