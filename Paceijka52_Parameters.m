% TIre parameters for Tire Model "Magic Formula" 5.2:
if (isempty(tir_file_front) | isempty(tir_file_rear))
%% Front
% Longitudinal
PCX1f =  1.6055;               % Shape factor Cfx for longitudinal force
PDX1f =  1.1703;               % Longitudinal friction Mux at Fznom
PDX2f =  -0.081328;            % Variation of friction Mux with load
PEX1f =  0.53409;              % Longitudinal curvature Efx with load
PEX2f =  -0.019956;            % Variation of curvature Efx with load
PEX3f =  0.18089;              % Variation of curvature Efx with load squared
PEX4f =  2.9951e-07;           % Factor of curvature Efx while driving
PHX1f = 0;                     % Horizontal shift Shx at Fznom
PHX2f = 0;                     % Variation of shift Shx with load
PKX1f = 36.411;                % Longitudinal slip stiffness Kfx/Fz at Fznom
PKX2f = 0.12615;               % Variation of slip stiffness Kfx/Fz with load
PKX3f = 0.51289;               % Exponent in slip stiffness Kfx/Fz with load
PVX1f =  0;                    % Vertical shift Svx/Fz at Fznom
PVX2f =  0;                    % Variation of shift Svx/Fz with load
exf   =  10e-12;
RBX1f = 18.456;             % Slope factor for combined slip Fx reduction
RBX2f = 16.314;             % Variation of slope Fx reduction with kappa
RCX1f = 1.091;               % Shape factor for combined slip Fx reduction
REX1f = 0;                      % Curvature factor of combined Fx
REX2f = 0;                      % Curvature factor of combined Fx with load
RHX1f = 0.0058715;        % Horizontal shift Shx at Fznom
FNOMINf = 5100;             % Tire nominal load

% Lateral
PCY1f = 2.1322;                 % Shape factor Cfy for lateral force
PDY1f = 1.0283;                 % Lateral friction Muy
PDY2f = -0.16758;               % Variation of friction Muy with load
PDY3f = -1.5821;                % Variation of friction Muy with squared camber
PEY1f = 0.33443;                % Lateral curvature Efy at Fznom
PEY2f = -1.8733;                % Variation of curvature Efy with load
PEY3f = -0.13136;               % Zero order camber dependency of curvature Efy
PEY4f = -11.677;                % Variation of curvature Efy with camber
PHY1f = 0.0031377;              % Horizontal shift Shy at Fznom
PHY2f =  0.00051596;            % Variation of shift Shy with load
PHY3f =  0.039251;                  % Variation of shift Shy with camber
PKY1f = -20.505;                % Lateral slip stiffness Kfy/Fz at Fznom
PKY2f =  2.0284;                % Load at which Kfy reaches maximum value
PKY3f =  0.89994;               % Variation of Kfy/Fznom with camber
PKY4f =  1.9896;                %Originally pky4 to pky7 are not included in model 5.2
PKY5f =  0;                         % -------------
PKY6f = -0.9004;                %These values are taken from model 6.2
PKY7f = -0.2328;                % -------------
PVY1f =  0.026365;              % Kappa induced side force Svyk/Muy*Fz at Fznom
PVY2f =  -0.0062119;            % Variation of Svyk/Muy*Fz with load
PVY3f =  -0.41389;                % Variation of Svyk/Muy*Fz with camber
PVY4f =  -0.048038;             % Variation of Svyk/Muy*Fz with alpha
eyf = 1e-12;
RBY1f = 22.003;                 % Slope factor for combined Fy reductions
RBY2f = -13.623;                % Variation of slope Fy reduction with alpha
RBY3f = -0.0093616;           % Shift term for alpha in slope Fy reduction
RCY1f = 0.98294;                % Shape factor for combined Fy reduction
REY1f = 0;                          % Curvature factor of combined Fy
REY2f = 0;                          % Curvature factor of combined Fy with load
RHY1f = -9.1492e-11;          % Shift factor for combined Fy reduction
RHY2f = 0;                          % Shift factor for combined Fy reduction with load
RVY1f = 22.965;                 % Kappa induced side force Svyk/Muy*Fz at Fznom
RVY2f = 0.37981;                % Variation of Svyk/Muy*Fz with load
RVY3f = 1.8552;                  % Variation of Svyk/Muy*Fz with camber
RVY4f = 0.08767;                % Variation of Svyk/Muy*Fz with alpha
RVY5f = -8.8234e-11;          % Variation of Svyk/Muy*Fz with kappa
RVY6f = 0.90374;                % Variation of Svyk/Muy*Fz with atan(kappa)

% Aligning Torque
QHZ1f = 8.2436e-04;            % Trail horizontal shift Sht at FzNom
QHZ2f = 0.002733;               % Variation of shift Sht with load
QHZ3f = 0.15;                      % Variation of shift Sht with camber
QHZ4f = 0.11608;                % Variation of shift Sht with camber and load
QBZ1f = 19.588;                  % Trail slope factor for trail Bpt at FzNom
QBZ2f = -4.1671;                 % Variation of slope Bpt with load
QBZ3f = -0.34132;               % Variation of slope Bpt with squared load
QBZ4f = -0.023607;             % Variation of slope Bpt with camber
QBZ5f = -0.0793;                 % Variation of slope Bpt with absolute camber
QCZ1f = 1.2012;                  % Shape factor Cpt for pneumatic trail
QDZ1f = 0.12819;                % Peak trail Dpt'' = Dpt*(Fz/FzNom*R0)
QDZ2f = -0.0052433;           % Variation of peak Dpt'' with load
QDZ3f = -0.099544;             % Variation of peak Dpt'' with camber 
QDZ4f =  -15.0;                   % Variation of peak Dpt'' with squared camber 
QEZ1f = -0.0044308;           % Trail curvature Ept at FzNom 
QEZ2f = 0.022579;              % Variation of curvature Ept with load
QEZ3f = -0.16199;               % Variation of curvature Ept with squared load
QEZ4f = -0.5576;                 % Variation of curvature Ept with sign of Alpha-t
QEZ5f = -87.296;                 % Variation of curvature Ept with camber and sign Alpha-t
QBZ9f = -50.0;                     % Slope factor Br of residual torque Mzr
QBZ10f =  0.000;                 % Slope factor Br of residual torque Mzr
QDZ6f = 6.2499e-05;           % Peak resisual torque Dmr'' = Dmr*(Fz*R0)
QDZ7f = 5.0135e-04;           % Variation of peak factor Dmr'' with load
QDZ8f = -0.28564;               % Variation of peak factor Dmr'' with camber
QDZ9f = -0.025056;             % Variation of peak factor Dmr'' with camber and load
R0f = 0.3185;                       % Free tire radius
zeta7f = 1;                           %Reduction factor for Cr (no turnslip)
SSZ1f = -5.3899e-10;           % Nominal value of s/R0 effect of Fx on Mz
SSZ2f = -2.2371e-09;           % Variation of distance s/R0 with Fy/FzNom
SSZ3f = 3.6029e-08;            % Variation of distance s/R0 with camber
SSZ4f = 3.9826e-08;             % Variation of distance s/R0 with camber and load


% Rolling Resistance
QSY1f = 0.01;                    % Rolling resistance torque coefficient
QSY2f = 0.0;                       % Rolling resistance torque depending on Fx
QSY3f = 0.0;                       % Rolling resistance torque depending on speed 
QSY4f = 0.0;                       % Rolling resistance torque depending on speed ^4
VREFf = 10;                        % Measurement speed [m/s]

%% Rear
% Longitudinal
PCX1r =  1.6055;               % Shape factor Cfx for longitudinal force
PDX1r =  1.1703;               % Longitudinal friction Mux at Fznom
PDX2r =  -0.081328;            % Variation of friction Mux with load
PEX1r =  0.53409;              % Longitudinal curvature Efx with load
PEX2r =  -0.019956;            % Variation of curvature Efx with load
PEX3r =  0.18089;              % Variation of curvature Efx with load squared
PEX4r =  2.9951e-07;           % Factor of curvature Efx while driving
PHX1r = 0;                     % Horizontal shift Shx at Fznom
PHX2r = 0;                     % Variation of shift Shx with load
PKX1r = 36.411;                % Longitudinal slip stiffness Kfx/Fz at Fznom
PKX2r = 0.12615;               % Variation of slip stiffness Kfx/Fz with load
PKX3r = 0.51289;               % Exponent in slip stiffness Kfx/Fz with load
PVX1r =  0;                    % Vertical shift Svx/Fz at Fznom
PVX2r =  0;                    % Variation of shift Svx/Fz with load
exr   =  10e-12;
RBX1r = 18.456;             % Slope factor for combined slip Fx reduction
RBX2r = 16.314;             % Variation of slope Fx reduction with kappa
RCX1r = 1.091;               % Shape factor for combined slip Fx reduction
REX1r = 0;                      % Curvature factor of combined Fx
REX2r = 0;                      % Curvature factor of combined Fx with load
RHX1r = 0.0058715;        % Horizontal shift Shx at Fznom
FNOMINr = 5100;             % Tire nominal load
% Lateral
PCY1r = 2.1322;                 % Shape factor Cfy for lateral force
PDY1r = 1.0283;                 % Lateral friction Muy
PDY2r = -0.16758;               % Variation of friction Muy with load
PDY3r = -1.5821;                % Variation of friction Muy with squared camber
PEY1r = 0.33443;                % Lateral curvature Efy at Fznom
PEY2r = -1.8733;                % Variation of curvature Efy with load
PEY3r = -0.13136;               % Zero order camber dependency of curvature Efy
PEY4r = -11.677;                % Variation of curvature Efy with camber
PHY1r = 0.0031377;              % Horizontal shift Shy at Fznom
PHY2r =  0.00051596;            % Variation of shift Shy with load
PHY3r =  0.039251;                  % Variation of shift Shy with camber
PKY1r = -20.505;                % Lateral slip stiffness Kfy/Fz at Fznom
PKY2r =  2.0284;                % Load at which Kfy reaches maximum value
PKY3r =  0.89994;               % Variation of Kfy/Fznom with camber
PKY4r =  1.9896;                %Originally pky4 to pky7 are not included in model 5.2
PKY5r =  0;                         % -------------
PKY6r = -0.9004;                %These values are taken from model 6.2
PKY7r = -0.2328;                % -------------
PVY1r =  0.026365;              % Kappa induced side force Svyk/Muy*Fz at Fznom
PVY2r =  -0.0062119;            % Variation of Svyk/Muy*Fz with load
PVY3r =  -0.41389;                % Variation of Svyk/Muy*Fz with camber
PVY4r =  -0.048038;             % Variation of Svyk/Muy*Fz with alpha
eyr = 1e-12;
RBY1r = 22.003;                 % Slope factor for combined Fy reductions
RBY2r = -13.623;                % Variation of slope Fy reduction with alpha
RBY3r = -0.0093616;           % Shift term for alpha in slope Fy reduction
RCY1r = 0.98294;                % Shape factor for combined Fy reduction
REY1r = 0;                          % Curvature factor of combined Fy
REY2r = 0;                          % Curvature factor of combined Fy with load
RHY1r = -9.1492e-11;          % Shift factor for combined Fy reduction
RHY2r = 0;                          % Shift factor for combined Fy reduction with load
RVY1r = 22.965;                 % Kappa induced side force Svyk/Muy*Fz at Fznom
RVY2r = 0.37981;                % Variation of Svyk/Muy*Fz with load
RVY3r = 1.8552;                  % Variation of Svyk/Muy*Fz with camber
RVY4r = 0.08767;                % Variation of Svyk/Muy*Fz with alpha
RVY5r = -8.8234e-11;          % Variation of Svyk/Muy*Fz with kappa
RVY6r = 0.90374;                % Variation of Svyk/Muy*Fz with atan(kappa)

% Aligning Torque
QHZ1r = 8.2436e-04;            % Trail horizontal shift Sht at FzNom
QHZ2r = 0.002733;               % Variation of shift Sht with load
QHZ3r = 0.15;                      % Variation of shift Sht with camber
QHZ4r = 0.11608;                % Variation of shift Sht with camber and load
QBZ1r = 19.588;                  % Trail slope factor for trail Bpt at FzNom
QBZ2r = -4.1671;                 % Variation of slope Bpt with load
QBZ3r = -0.34132;               % Variation of slope Bpt with squared load
QBZ4r = -0.023607;             % Variation of slope Bpt with camber
QBZ5r = -0.0793;                 % Variation of slope Bpt with absolute camber
QCZ1r = 1.2012;                  % Shape factor Cpt for pneumatic trail
QDZ1r = 0.12819;                % Peak trail Dpt'' = Dpt*(Fz/FzNom*R0)
QDZ2r = -0.0052433;           % Variation of peak Dpt'' with load
QDZ3r = -0.099544;             % Variation of peak Dpt'' with camber 
QDZ4r =  -15.0;                   % Variation of peak Dpt'' with squared camber 
QEZ1r = -0.0044308;           % Trail curvature Ept at FzNom 
QEZ2r = 0.022579;              % Variation of curvature Ept with load
QEZ3r = -0.16199;               % Variation of curvature Ept with squared load
QEZ4r = -0.5576;                 % Variation of curvature Ept with sign of Alpha-t
QEZ5r = -87.296;                 % Variation of curvature Ept with camber and sign Alpha-t
QBZ9r = -50.0;                     % Slope factor Br of residual torque Mzr
QBZ10r =  0.000;                 % Slope factor Br of residual torque Mzr
QDZ6r = 6.2499e-05;           % Peak resisual torque Dmr'' = Dmr*(Fz*R0)
QDZ7r = 5.0135e-04;           % Variation of peak factor Dmr'' with load
QDZ8r = -0.28564;               % Variation of peak factor Dmr'' with camber
QDZ9r = -0.025056;             % Variation of peak factor Dmr'' with camber and load
R0r = 0.3185;                       % Free tire radius
zeta7r = 1;                           %Reduction factor for Cr (no turnslip)
SSZ1r = -5.3899e-10;           % Nominal value of s/R0 effect of Fx on Mz
SSZ2r = -2.2371e-09;           % Variation of distance s/R0 with Fy/FzNom
SSZ3r = 3.6029e-08;            % Variation of distance s/R0 with camber
SSZ4r = 3.9826e-08;             % Variation of distance s/R0 with camber and load


% Rolling Resistance
QSY1r = 0.01;                    % Rolling resistance torque coefficient
QSY2r = 0.0;                       % Rolling resistance torque depending on Fx
QSY3r = 0.0;                       % Rolling resistance torque depending on speed 
QSY4r = 0.0;                       % Rolling resistance torque depending on speed ^4
VREFr = 10;                        % Measurement speed [m/s]

else
    tireF = readTIRFiles(tir_file_front);
    tireR = readTIRFiles(tir_file_rear);
    
    %% Front
% Longitudinal
PCX1f =  tireF.PCX1;               % Shape factor Cfx for longitudinal force
PDX1f =  tireF.PDX1;               % Longitudinal friction Mux at Fznom
PDX2f =  tireF.PDX2;            % Variation of friction Mux with load
PEX1f =  tireF.PEX1;              % Longitudinal curvature Efx with load
PEX2f =  tireF.PEX2;            % Variation of curvature Efx with load
PEX3f =  tireF.PEX3;              % Variation of curvature Efx with load squared
PEX4f =  tireF.PEX4;           % Factor of curvature Efx while driving
PHX1f = tireF.PHX1;                     % Horizontal shift Shx at Fznom
PHX2f = tireF.PHX2;                     % Variation of shift Shx with load
PKX1f = tireF.PKX1;                % Longitudinal slip stiffness Kfx/Fz at Fznom
PKX2f = tireF.PKX2;               % Variation of slip stiffness Kfx/Fz with load
PKX3f = tireF.PKX3;               % Exponent in slip stiffness Kfx/Fz with load
PVX1f =  tireF.PVX1;                    % Vertical shift Svx/Fz at Fznom
PVX2f =  tireF.PVX2;                    % Variation of shift Svx/Fz with load
exf   =  10e-12;
RBX1f = tireF.RBX1;             % Slope factor for combined slip Fx reduction
RBX2f = tireF.RBX2;             % Variation of slope Fx reduction with kappa
RCX1f = tireF.RCX1;               % Shape factor for combined slip Fx reduction
REX1f = tireF.REX1;                      % Curvature factor of combined Fx
REX2f = tireF.REX2;                      % Curvature factor of combined Fx with load
RHX1f = tireF.RHX1;        % Horizontal shift Shx at Fznom
FNOMINf = tireF.FNOMIN;      %Tire nominal load

% Lateral
PCY1f = tireF.PCY1;                 % Shape factor Cfy for lateral force
PDY1f = tireF.PDY1;                 % Lateral friction Muy
PDY2f = tireF.PDY2;               % Variation of friction Muy with load
PDY3f = tireF.PDY3;                % Variation of friction Muy with squared camber
PEY1f = tireF.PEY1;                % Lateral curvature Efy at Fznom
PEY2f = tireF.PEY2;                % Variation of curvature Efy with load
PEY3f = tireF.PEY3;               % Zero order camber dependency of curvature Efy
PEY4f = tireF.PEY4;                % Variation of curvature Efy with camber
PHY1f = tireF.PHY1;              % Horizontal shift Shy at Fznom
PHY2f =  tireF.PHY2;            % Variation of shift Shy with load
PHY3f =  tireF.PHY3;                  % Variation of shift Shy with camber
PKY1f = tireF.PKY1;                % Lateral slip stiffness Kfy/Fz at Fznom
PKY2f =  tireF.PKY2;                % Load at which Kfy reaches maximum value
PKY3f =  tireF.PKY3;               % Variation of Kfy/Fznom with camber
PKY4f =  tireF.PKY4;                %Originally pky4 to pky7 are not included in model 5.2
PKY5f =  tireF.PKY5;                         % -------------
PKY6f = tireF.PKY6;                %These values are taken from model 6.2
PKY7f = tireF.PKY7;                % -------------
PVY1f =  tireF.PVY1;              % Kappa induced side force Svyk/Muy*Fz at Fznom
PVY2f =  tireF.PVY2;            % Variation of Svyk/Muy*Fz with load
PVY3f =  tireF.PVY3;                % Variation of Svyk/Muy*Fz with camber
PVY4f =  tireF.PVY4;             % Variation of Svyk/Muy*Fz with alpha
eyf = 1e-12;
RBY1f = tireF.RBY1;                 % Slope factor for combined Fy reductions
RBY2f = tireF.RBY2;                % Variation of slope Fy reduction with alpha
RBY3f = tireF.RBY3;           % Shift term for alpha in slope Fy reduction
RCY1f = tireF.RCY1;                % Shape factor for combined Fy reduction
REY1f = tireF.REY1;                          % Curvature factor of combined Fy
REY2f = tireF.REY2;                          % Curvature factor of combined Fy with load
RHY1f = tireF.RHY1;          % Shift factor for combined Fy reduction
RHY2f = tireF.RHY2;                          % Shift factor for combined Fy reduction with load
RVY1f = tireF.RVY1;                 % Kappa induced side force Svyk/Muy*Fz at Fznom
RVY2f = tireF.RVY2;                % Variation of Svyk/Muy*Fz with load
RVY3f = tireF.RVY3;                  % Variation of Svyk/Muy*Fz with camber
RVY4f = tireF.RVY4;                % Variation of Svyk/Muy*Fz with alpha
RVY5f = tireF.RVY5;          % Variation of Svyk/Muy*Fz with kappa
RVY6f = tireF.RVY6;                % Variation of Svyk/Muy*Fz with atan(kappa)

% Aligning Torque
QHZ1f = tireF.QHZ1;            % Trail horizontal shift Sht at FzNom
QHZ2f = tireF.QHZ2;            % Variation of shift Sht with load
QHZ3f = tireF.QHZ3;            % Variation of shift Sht with camber
QHZ4f = tireF.QHZ4;            % Variation of shift Sht with camber and load
QBZ1f = tireF.QBZ1;            % Trail slope factor for trail Bpt at FzNom
QBZ2f = tireF.QBZ2;            % Variation of slope Bpt with load
QBZ3f = tireF.QBZ3;            % Variation of slope Bpt with squared load
QBZ4f = tireF.QBZ4;            % Variation of slope Bpt with camber
QBZ5f = tireF.QBZ5;            % Variation of slope Bpt with absolute camber
QCZ1f = tireF.QCZ1;            % Shape factor Cpt for pneumatic trail
QDZ1f = tireF.QDZ1;            % Peak trail Dpt'' = Dpt*(Fz/FzNom*R0)
QDZ2f = tireF.QDZ2;            % Variation of peak Dpt'' with load
QDZ3f = tireF.QDZ3;            % Variation of peak Dpt'' with camber 
QDZ4f = tireF.QDZ4;            % Variation of peak Dpt'' with squared camber 
QEZ1f = tireF.QEZ1;            % Trail curvature Ept at FzNom 
QEZ2f = tireF.QEZ2;            % Variation of curvature Ept with load
QEZ3f = tireF.QEZ3;            % Variation of curvature Ept with squared load
QEZ4f = tireF.QEZ4;            % Variation of curvature Ept with sign of Alpha-t
QEZ5f = tireF.QEZ5;            % Variation of curvature Ept with camber and sign Alpha-t
QBZ9f = tireF.QBZ9;            % Slope factor Br of residual torque Mzr
QBZ10f = tireF.QBZ10;        % Slope factor Br of residual torque Mzr
QDZ6f = tireF.QDZ6;            % Peak resisual torque Dmr'' = Dmr*(Fz*R0)
QDZ7f = tireF.QDZ7;            % Variation of peak factor Dmr'' with load
QDZ8f = tireF.QDZ8;            % Variation of peak factor Dmr'' with camber
QDZ9f = tireF.QDZ9;            % Variation of peak factor Dmr'' with camber and load
R0f = tireF.UNLOADED_RADIUS;% Free tire radius
zeta7f = 1;                           %Reduction factor for Cr (no turnslip)
SSZ1f = tireF.SSZ1;             % Nominal value of s/R0 effect of Fx on Mz
SSZ2f = tireF.SSZ2;             % Variation of distance s/R0 with Fy/FzNom
SSZ3f = tireF.SSZ3;             % Variation of distance s/R0 with camber
SSZ4f = tireF.SSZ4;             % Variation of distance s/R0 with camber and load


% Rolling Resistance
QSY1f = tireF.QSY1;           % Rolling resistance torque coefficient
QSY2f = tireF.QSY2;           % Rolling resistance torque depending on Fx
QSY3f = tireF.QSY3;           % Rolling resistance torque depending on speed 
QSY4f = tireF.QSY4;           % Rolling resistance torque depending on speed ^4
VREFf = 10;                        % Measurement speed [m/s]

    %% Rear
% Longitudinal
PCX1r =  tireR.PCX1;               % Shape factor Cfx for longitudinal force
PDX1r =  tireR.PDX1;               % Longitudinal friction Mux at Fznom
PDX2r =  tireR.PDX2;            % Variation of friction Mux with load
PEX1r =  tireR.PEX1;              % Longitudinal curvature Efx with load
PEX2r =  tireR.PEX2;            % Variation of curvature Efx with load
PEX3r =  tireR.PEX3;              % Variation of curvature Efx with load squared
PEX4r =  tireR.PEX4;           % Factor of curvature Efx while driving
PHX1r = tireR.PHX1;                     % Horizontal shift Shx at Fznom
PHX2r = tireR.PHX2;                     % Variation of shift Shx with load
PKX1r = tireR.PKX1;                % Longitudinal slip stiffness Kfx/Fz at Fznom
PKX2r = tireR.PKX2;               % Variation of slip stiffness Kfx/Fz with load
PKX3r = tireR.PKX3;               % Exponent in slip stiffness Kfx/Fz with load
PVX1r =  tireR.PVX1;                    % Vertical shift Svx/Fz at Fznom
PVX2r =  tireR.PVX2;                    % Variation of shift Svx/Fz with load
exr   =  10e-12;
RBX1r = tireR.RBX1;             % Slope factor for combined slip Fx reduction
RBX2r = tireR.RBX2;             % Variation of slope Fx reduction with kappa
RCX1r = tireR.RCX1;               % Shape factor for combined slip Fx reduction
REX1r = tireR.REX1;                      % Curvature factor of combined Fx
REX2r = tireR.REX2;                      % Curvature factor of combined Fx with load
RHX1r = tireR.RHX1;        % Horizontal shift Shx at Fznom
FNOMINr = tireR.FNOMIN;      %Tire nominal load

% Lateral
PCY1r = tireR.PCY1;                 % Shape factor Cfy for lateral force
PDY1r = tireR.PDY1;                 % Lateral friction Muy
PDY2r = tireR.PDY2;               % Variation of friction Muy with load
PDY3r = tireR.PDY3;                % Variation of friction Muy with squared camber
PEY1r = tireR.PEY1;                % Lateral curvature Efy at Fznom
PEY2r = tireR.PEY2;                % Variation of curvature Efy with load
PEY3r = tireR.PEY3;               % Zero order camber dependency of curvature Efy
PEY4r = tireR.PEY4;                % Variation of curvature Efy with camber
PHY1r = tireR.PHY1;              % Horizontal shift Shy at Fznom
PHY2r =  tireR.PHY2;            % Variation of shift Shy with load
PHY3r =  tireR.PHY3;                  % Variation of shift Shy with camber
PKY1r = tireR.PKY1;                % Lateral slip stiffness Kfy/Fz at Fznom
PKY2r =  tireR.PKY2;                % Load at which Kfy reaches maximum value
PKY3r =  tireR.PKY3;               % Variation of Kfy/Fznom with camber
PKY4r =  tireR.PKY4;                %Originally pky4 to pky7 are not included in model 5.2
PKY5r =  tireR.PKY5;                         % -------------
PKY6r = tireR.PKY6;                %These values are taken from model 6.2
PKY7r = tireR.PKY7;                % -------------
PVY1r =  tireR.PVY1;              % Kappa induced side force Svyk/Muy*Fz at Fznom
PVY2r =  tireR.PVY2;            % Variation of Svyk/Muy*Fz with load
PVY3r =  tireR.PVY3;                % Variation of Svyk/Muy*Fz with camber
PVY4r =  tireR.PVY4;             % Variation of Svyk/Muy*Fz with alpha
eyr = 1e-12;
RBY1r = tireR.RBY1;                 % Slope factor for combined Fy reductions
RBY2r = tireR.RBY2;                % Variation of slope Fy reduction with alpha
RBY3r = tireR.RBY3;           % Shift term for alpha in slope Fy reduction
RCY1r = tireR.RCY1;                % Shape factor for combined Fy reduction
REY1r = tireR.REY1;                          % Curvature factor of combined Fy
REY2r = tireR.REY2;                          % Curvature factor of combined Fy with load
RHY1r = tireR.RHY1;          % Shift factor for combined Fy reduction
RHY2r = tireR.RHY2;                          % Shift factor for combined Fy reduction with load
RVY1r = tireR.RVY1;                 % Kappa induced side force Svyk/Muy*Fz at Fznom
RVY2r = tireR.RVY2;                % Variation of Svyk/Muy*Fz with load
RVY3r = tireR.RVY3;                  % Variation of Svyk/Muy*Fz with camber
RVY4r = tireR.RVY4;                % Variation of Svyk/Muy*Fz with alpha
RVY5r = tireR.RVY5;          % Variation of Svyk/Muy*Fz with kappa
RVY6r = tireR.RVY6;                % Variation of Svyk/Muy*Fz with atan(kappa)

% Aligning Torque
QHZ1r = tireR.QHZ1;            % Trail horizontal shift Sht at FzNom
QHZ2r = tireR.QHZ2;            % Variation of shift Sht with load
QHZ3r = tireR.QHZ3;            % Variation of shift Sht with camber
QHZ4r = tireR.QHZ4;            % Variation of shift Sht with camber and load
QBZ1r = tireR.QBZ1;            % Trail slope factor for trail Bpt at FzNom
QBZ2r = tireR.QBZ2;            % Variation of slope Bpt with load
QBZ3r = tireR.QBZ3;            % Variation of slope Bpt with squared load
QBZ4r = tireR.QBZ4;            % Variation of slope Bpt with camber
QBZ5r = tireR.QBZ5;            % Variation of slope Bpt with absolute camber
QCZ1r = tireR.QCZ1;            % Shape factor Cpt for pneumatic trail
QDZ1r = tireR.QDZ1;            % Peak trail Dpt'' = Dpt*(Fz/FzNom*R0)
QDZ2r = tireR.QDZ2;            % Variation of peak Dpt'' with load
QDZ3r = tireR.QDZ3;            % Variation of peak Dpt'' with camber 
QDZ4r = tireR.QDZ4;            % Variation of peak Dpt'' with squared camber 
QEZ1r = tireR.QEZ1;            % Trail curvature Ept at FzNom 
QEZ2r = tireR.QEZ2;            % Variation of curvature Ept with load
QEZ3r = tireR.QEZ3;            % Variation of curvature Ept with squared load
QEZ4r = tireR.QEZ4;            % Variation of curvature Ept with sign of Alpha-t
QEZ5r = tireR.QEZ5;            % Variation of curvature Ept with camber and sign Alpha-t
QBZ9r = tireR.QBZ9;            % Slope factor Br of residual torque Mzr
QBZ10r = tireR.QBZ10;        % Slope factor Br of residual torque Mzr
QDZ6r = tireR.QDZ6;            % Peak resisual torque Dmr'' = Dmr*(Fz*R0)
QDZ7r = tireR.QDZ7;            % Variation of peak factor Dmr'' with load
QDZ8r = tireR.QDZ8;            % Variation of peak factor Dmr'' with camber
QDZ9r = tireR.QDZ9;            % Variation of peak factor Dmr'' with camber and load
R0r = tireR.UNLOADED_RADIUS;% Free tire radius
zeta7r = 1;                           %Reduction factor for Cr (no turnslip)
SSZ1r = tireR.SSZ1;             % Nominal value of s/R0 effect of Fx on Mz
SSZ2r = tireR.SSZ2;             % Variation of distance s/R0 with Fy/FzNom
SSZ3r = tireR.SSZ3;             % Variation of distance s/R0 with camber
SSZ4r = tireR.SSZ4;             % Variation of distance s/R0 with camber and load

% Rolling Resistance
QSY1r = tireR.QSY1;           % Rolling resistance torque coefficient
QSY2r = tireR.QSY2;           % Rolling resistance torque depending on Fx
QSY3r = tireR.QSY3;           % Rolling resistance torque depending on speed 
QSY4r = tireR.QSY4;           % Rolling resistance torque depending on speed ^4
VREFr = 10;                        % Measurement speed [m/s]

end