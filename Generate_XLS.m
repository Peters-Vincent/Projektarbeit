filename = 'Simulation_output.xls';
% Change the sheet to save multiple vehicles for animation (comment the next line):
%delete Simulation_output.xls;
sheet = 1;
time = x_pos.Time;
angleFL_1 = reshape(angleFL.Data,1,length(angleFL.Data));
angleFR_1 = reshape(angleFR.Data,1,length(angleFR.Data));
angleRL_1 = reshape(angleRL.Data,1,length(angleRL.Data));
angleRR_1 = reshape(angleRR.Data,1,length(angleRR.Data));
Results_values = [x_pos.Data, y_pos.Data, z.Data, phi.Data, theta.Data, psi.Data,...
    angleFL_1', angleFR_1', angleRL_1', angleRR_1',...
    deltaFL.Data, deltaFR.Data, deltaRL.Data, deltaRR.Data,...
    zFL.Data, zFR.Data, zRL.Data, zRR.Data, time];
% Results_names = {'x','y','z','phi','theta','psi','time'};
xlswrite(filename,Results_values,sheet,'A1');
% xlswrite(filename,Results_names,sheet,'A1');

