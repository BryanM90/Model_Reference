% Reference Model for MRAC
% NA 583
% University of Michigan - Fall 2016

% Fanny was here
% Bryan was here


% Model parameters
Ms  = 355;      % [kg]
Mus = 30;       % [kg]
K1  = 1500;    % [N/m]
K2  = 15000;   % [N/m]
Bm  = 3000;     % [N/m/s]

% State Space representation
A = [    0      1      0        0
      -K2/Mus   0    K1/Mus     0
         0     -1      0        1
         0      0   -K1/Ms   -Bm/Ms ];
B = [-1 0 0 0]';
C = [0 0 1 0        % y(1) = z_s - z_us (Suspension stroke)
     0 0 0 1];      % y(2) = \dot(z_s)  (unsprung mass velocity)
D = [0;0];

sys = ss(A,B,C,D);

% Simulation
t = 0:0.01:10;
y = lsim(sys,sin(t),t);

% Plot
figure
plot(t,sin(t),'r--',t,y(:,1),'k',t,y(:,2),'b-.')
set(findall(gcf,'type','line'),'linewidth',2)
set(gca,'fontsize',12); grid on; box on
leg = legend('Terrain Disturbance','Suspension stroke','Mass velocity');
set(leg,'interpreter','latex','fontsize',16,'location','southeast');
xlabel('Time [sec]' ,'interpreter','latex','fontsize',16);