clear; clc
%% Simulation parameters
T_simulation = 20;
simulation_step_time = 0.001; % For fixed-step solvers [s]
output_samping_time = 0.001; % Sampling time for saving the outputs of the simulation [s]
%% Vehicle Parameters
g = 9.806; % gravity acceleration [m/s^2]

m = 1310; % sprung mass [kg]
mF = 45; % half front unsprung mass [kg]
mR = 50; % half rear unsprung mass [kg]

hcog = 0.5; % height of center of gravity of sprung mass [m]
huFcog = 0.32; % height of center of gravity of front unsprung mass [m]
huRcog = 0.32; % height of center of gravity of rear unsprung mass [m]

Jx = 430; % roll inertia [kg.m^2]
Jy = 1309; % pitch inertia [kg.m^2]
Jz = 1461; % yaw inertia [kg.m^2]
JwF = 2.45; % front wheels inertia [kg.m^2]
JwR = 2.45; % rear wheels inertia [kg.m^2]

l = 2.5; %wheelbase of vehicle [m]
lF = 1.223; % distance of the front axle to the center of gravity [m]
lR = l-lF; % distance of the rear axle to the center of gravity [m]
wF = 1.578; % front track [m]
wR = 1.544; % rear track [m]


hpc = 0.0; % height of pitch center [m]
hrcF = 0.3; % height of the roll center at the front axle [m]
hrcR = 0.2; % height of the roll center at the rear axle [m]

kF = 40000; % front springs rate [N/m]
kR = 35000; % rear springs rate [N/m]

cF = 5000; % Damping rate at the front [Ns/m]
cR = 5000; % Damping rate at the rear [Ns/m]

kRF = 0; % Front antiroll bar rate [N/m] or [Nm/rad]
kRR = 0; % Rear antiroll bar rate [N/m] or [Nm/rad]

% Aerodynamics 
clF = -0.15; % Front lift coefficient (negative creates downforce)
clR = -0.20; % Rear lift coefficient  (negative creates downforce)
cd = 0.35; % Drag coefficient
A = 2; % Vehicle's frontal area [m^2]
rho = 1.2; % Air density [kg/m^3]

steer_ratio = 13.25; % Ratio between steering wheel and wheel toe angle

%% Driver and Powertrain
%1 -> enabled; 0-> disabled
enableLongDynamics = 1; %If disabled, the vehicle will cruise at a constant speed defined by the user in the Vx0 variable and no forces will slow the vehicle
enablePowertrain = 1;   % If disabled no torque will be sent to the wheels from the powertrain or brakes but external torques can be introduced by the user in the “Enable powertrain block” in the Simulink model. 

% Gear Ratios Map (1st to Last gear)
GR = [2.9 1.8 1.3 1 0.85 0.75];
Gear_numbers = [1 2 3 4 5 6];
max_gears = length(Gear_numbers);

%Engine/Motors Maps
Engine = xlsread('EngineMap.xlsx','A2:C17');
throttle = [0:1/21:1]; %Throttle steps for interpolation
RPMME = Engine(:,1);
TorqueME = [];
for i = 1:16 %number of lines to generate Engine curve
    T = [0 1];
    E = [Engine(i,2) Engine(i,3)];
%     xx = (Engine(i,3) - Engine(i,2))/21; 
%     x = [E(1):xx:E(2)];
    TorqueME(i,:) = spline(T, E, throttle);
end

% Plot Engine Map (Torque and Engine)
figure(1);
h = surf(throttle*100,RPMME,TorqueME);xlabel('Throttle [%]');ylabel('Engine speed [RPM] '); zlabel('Engine Torque [Nm]'); title('Torque Engine Map');
set(h,'LineStyle','none')
colormap(jet);
figure(2);
h = surf(throttle*100,RPMME,TorqueME.*RPMME*30/pi);xlabel('Throttle [%]');ylabel('Engine speed [RPM] '); zlabel('Engine Power [W]'); title('Power Engine Map');
set(h,'LineStyle','none')
colormap(jet);


%Braking 
 cp_FA  = 30; % front axle cP-Value for estimation of the brake torque [N*m/bar] 
 cp_RA  = 13; % rear axle cP-Value for estimation of the brake torque [N*m/bar]
 max_pressure = 1000; % maximum pressure applied from the driver [bar]
 
%Front/Rear final drive ratio:
front_dr = 3.8; % [-]
rear_dr = 3.8;  % [-]

%AWD front-to-rear ratio (central_diff = 0 means RWD vehicle, 1 means FWD):
central_diff =1;

% Constant torques to be set by the user if powertrain is disabled 
TFL = 0; % constant torque at front left wheel [Nm]
TFR = 0; % constant torque at front right wheel [Nm]
TRL = 0; % constant torque at rear left wheel [Nm]
TRR = 0; % constant torque at rear right wheel [Nm]

enableDriverControl = 0; %% If disabled the “driver” will not track the requested speed but the user can introduce external throttle and brake inputs in the "driver block"

%/!\ If driver is enabled and powertrain disabled the driver comand will do nothing

% Driver parameters 
requested_speed = 100/3.6; %Speed that the driver is aiming for [m/s]
initial_gear = 1; %Initial selected gear by the driver
minrpm = 1500; %Engine rpm at which the driver will switch down gear [rpm]
maxrpm = 4000; %Engine rpm at which the driver will switch up gear [rpm]
%% Tire Parameters
% If you have a .tir file select it otherwise leave it empty (''):
% Select a .tir file for MFEval library and Paceijka 5.2
tir_file_rear = 'car235_50R24.tir';
tir_file_front = 'car235_50R24.tir';

% For the BCD tire formulation change the parameters in the following file:
BCD_Parameters

% For the Paceijka's Magic Formula change the parameters in the following file:
Paceijka52_Parameters

% Other tyre parameters:
if (isempty(tir_file_front) | isempty(tir_file_rear) )
    rF = 0.32; % front tyre radius [m]
    rR = 0.32; % rear tyre radius [m]
    ktF = 300000; % Vertical stiffness of the front tires [N/m]
    ktR = 300000; % Vertical stiffness of the rear tires [N/m] 
    ctF = 500; % Vertical damping of the front tires [Ns/m]
    ctR = 500; % Vertical damping of the rear tires [Ns/m]
else
    tireF = readTIRFiles(tir_file_front);
    tireR = readTIRFiles(tir_file_rear);
    rF = tireF.UNLOADED_RADIUS; % front tyre radius [m]
    rR = tireR.UNLOADED_RADIUS; % rear tyre radius [m]
    ktF = tireF.VERTICAL_STIFFNESS; % Vertical stiffness of the front tires [N/m]
    ktR = tireR.VERTICAL_STIFFNESS; % Vertical stiffness of the rear tires [N/m] 
    ctF = tireF.VERTICAL_DAMPING; % Vertical damping of the front tires [Ns/m]
    ctR = tireR.VERTICAL_DAMPING; % Vertical damping of the rear tires [Ns/m]
end
%% Tire model selection
WHEEL_ASSEMBLY_MFEVAL = Simulink.Variant('Mode == 1');
WHEEL_ASSEMBLY_BCD = Simulink.Variant('Mode == 2');
WHEEL_ASSEMBLY_PACEIJKA = Simulink.Variant('Mode == 3');

%Select mode 1 for MFEval Tire modelling, mode 2 for BCD Formulation, 3 for Magic Formula 5.2 Formulation
Mode = 1; 
%% Road parameters
bump_height = 0; % bump height [m]
bump_length = 1; % bump length [m]
bump_time = 1; % bump time [s]

%% Initial conditions

x0 = 0; % initial sprung mass position x [m]
Vx0 = 100/3.6; % initial sprung mass velocity x [m/s]

y0 = 0; % initial sprung mass position y [m]
Vy0 = 0; % initial sprung mass velocity y [m/s]

z0 = 0; % initial sprung mass position z [m]
Vz0 = 0; % initial sprung mass velocity z [m/s]

phi0 = 0; % initial sprung mass roll angle [rad]
phi_dot0 = 0; % initial sprung mass roll velocity [rad/s]

theta0 = 0; % initial sprung mass pitch angle [rad]
theta_dot0 = 0; % initial sprung pitch velocity [rad/s]

psi0 = 0; % initial sprung mass yaw angle [rad]
psi_dot0 = 0; % initial sprung yaw velocity [rad/s]

zFL0 = 0; % initial front left unsprung mass position [m]
zFL_dot0 = 0; % initial front left unsprung mass velocity [m/s]

zFR0 = 0; % initial front right unsprung mass position [m]
zFR_dot0 = 0; % initial front right unsprung mass velocity [m/s]

zRL0 = 0; % initial rear left unsprung mass position [m]
zRL_dot0 = 0; % initial rear left unsprung mass velocity [m/s]

zRR0 = 0; % initial rear right unsprung mass position [m]
zRR_dot0 = 0; % initial rear right unsprung mass velocity [m/s]

%% Parameters needed for the equations: these shouldn’t be changed

xR = l; % position of the rear axle (long. direction) [m]
xF = 0; % position of the front axle (long. direction) [m]
xs  = lF; % postion of the sprung mass cog (long. direction) [m]
xcog_overall = (2*mR*xR+2*xF*mF+m*xs)/(m+2*mF+2*mR); % position of the overall center of gravity (long. direction) [m]
hcog_overall = (hcog*m+2*huFcog*mF+2*huRcog*mR)/(m+2*mF+2*mR); % height of the overall center of gravity [m]
hrcg=(hrcF*lR+hrcR*lF)/(lF+lR); % height of the roll center at the center of gravity of the sprung mass [m]