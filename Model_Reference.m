%% Project file 1

Ms = 250;
Mus = 30;
K2 = 150000;
K1 = 15000;
Bm = 1000;

A = [    0      1      0        0
      -K2/Mus   0    K1/Mus     0
         0     -1      0        1
         0      0   -K1/Ms   -Bm/Ms ];
B = [-1 0 0 0]';
C = [0 0 1 0
     0 0 0 1];
D = [0;0];

sys = ss(A,B,C,D);
t = 0:0.01:10;

z = lsim(sys,sin(t),t);
figure;hold on
plot(t,sin(t))
plot(t,z(:,1))
plot(t,z(:,2))