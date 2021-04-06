%%%%
% Ref: [1]Y. C. Shiu and S. Ahmad, “Calibration of wrist-mounted robotic sensors by solving homogeneous transform equations of the form AX=XB,” Ieee T Robotic Autom, vol. 5, no. 1, pp. 16–29, 1989, doi: 10.1109/70.88014.
%%%%
clear
clc
%% Init

% Example data from Ref
A1 = [-0.989992 -0.141120 0.000000 0; ...
       0.141120 -0.989992 0.000000 0; ...
       0.000000  0.000000 1.000000 0;
           0         0        0    1];
B1 = [-0.989992 -0.138307 0.028036 -26.9559; ...
       0.138307 -0.911449 0.387470 -96.1332; ...
      -0.028036  0.387470 0.921456  19.4872; ...
           0         0        0         1];
A2 = [ 0.070737 0.000000 0.997495 -400.000; ...
       0.000000 1.000000 0.000000  0.000000; ...
      -0.997495 0.000000 0.070737  400.000; ...
           0        0        0         1];
B2 = [ 0.070737  0.198172  0.977612 -309.543; ...
      -0.198172  0.963323 -0.180936  59.0244; ...
      -0.977612 -0.180936  0.107415  291.177; ...
           0         0        0        1];
X_act = [1.000000 0.000000  0.000000 10; ...
         0.000000 0.980067 -0.198669 50; ...
         0.000000 0.198669  0.980067 100; ...
             0        0         0     1];

% Lab test data

%%
kA1 = rotation_axis(A1);
kB1 = rotation_axis(B1);
kA2 = rotation_axis(A2);
kB2 = rotation_axis(B2);

v1 = cross(kB1, kA1);
omega1 = atan2d(norm(v1), dot(kB1, kA1));
v1 = v1/norm(v1);
Rxp1 = rot(v1, omega1)

v2 = cross(kB2, kA2);
omega2 = atan2d(norm(v2), dot(kB2, kA2));
v2 = v2/norm(v2);
Rxp2 = rot(v2, omega2)

[beta1, beta2] = calculate_beta(kA1, kA2, Rxp1, Rxp2);
Rx = rot(kA1,beta1) * Rxp1  % Rx1
% Rx2 = rot(kA2,beta2) * Rxp2

Px = translation(A1, A2, B1, B2, Rx)