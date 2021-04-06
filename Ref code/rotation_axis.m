function k = rotation_axis(T)
% Axis of rotation of A1, B1, A2, B2
%   Input: A1/B1/A2/B2
%   Output: 3-by-1 k vector
nx = T(1,1);
ny = T(2,1);
nz = T(3,1);

ox = T(1,2);
oy = T(2,2);
oz = T(3,2);

ax = T(1,3);
ay = T(2,3);
az = T(3,3);

cos_theta = 0.5 * (nx + oy + az - 1);
vers_theta = 1 - cos_theta;
sin_theta = 0.5 * sqrt((oz - ay)^2 + (ax - nz)^2 + (ny - ox)^2);
theta = atan2d(sqrt((oz - ay)^2 + (ax - nz)^2 + (ny - ox)^2), nx + oy + az - 1);


flag = find([nx oy az] == max([nx oy az]));

if flag == 1
    kx = sgn(oz - ay) * sqrt((nx - cos_theta)/(vers_theta));
    ky = (ny + ox)/(2 * kx * verse_theta);
    kz = (ax + nz)/(2 * kx * verse_theta);
elseif flag == 2
    ky = sgn(ax - nz) * sqrt((oy - cos_theta)/(vers_theta));
    kx = (ny + ox)/(2 * ky * vers_theta);
    kz = (oz + ay)/(2 * ky * vers_theta);
else
    kz = sgn(ny - ox) * sqrt((az - cos_theta)/(vers_theta));
    kx = (ax + nz)/(2 * kz * vers_theta);
    ky = (oz + ay)/(2 * kz * vers_theta);
end

k = [kx, ky, kz]';

end

