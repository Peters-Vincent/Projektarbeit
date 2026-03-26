%==========================================================================
% Animation/snapshots script
%
% Need t,x,y,psi and delta vectors
%
%==========================================================================
% E. Velenis, Brunel University, 2009
%==========================================================================

% Animation
L = l;          % Vehicle length
w1 = wF;         % Front wheel lateral distance from CG
w2 = wR;       % Back wheel lateral distance from CG
l1 = lF;         % Front wheel longitudinal distance from CG
l2 = lR;       % Back wheel longitudinal distance from CG
lw = 0.7;       % Wheel diameter
hll = 0.4*L;    % Headlights long. distance
hlw = 0.4*w1;        % Headlights lat. distance
%=====================================================
% NOTE: change of sign convention to match short course
%=====================================================
x = x_pos.Data;
y = -y_pos.Data;
psi = -psi.Data;
delta = -deltaFL.Data;
t = y_pos.Time;
%=====================================================

tfinal = t(length(t));
tanim = 0:1:tfinal;

rA_b = [L/2 0]';
rB_b = [-L/2 0]';
rC_b = [0 0]';
rD_b = [-0.9*L/2 0]';
rE_b = [0.3*L/2 0]';
rHL1_b = [hll hlw]';
rHL2_b = [hll -hlw]';
r1_b = [l1 w1]';
r2_b = [l1 -w1]';
r3_b = [-l2 w2]';
r4_b = [-l2 -w2]';
r1f_w = [lw/2 0]';
r1b_w = [-lw/2 0]';
r2f_w = [lw/2 0]';
r2b_w = [-lw/2 0]';
r3f_b = [-l2+lw/2 w2]';
r3b_b = [-l2-lw/2 w2]';
r4f_b = [-l2+lw/2 -w2]';
r4b_b = [-l2-lw/2 -w2]';

% Initial Position
xc_in = x(1);
yc_in = y(1);
psi_in = psi(1);
delta_in = delta(1);

for i = 1:length(t)
    deltaSS(i) = delta(i);
end


RIB_in = [cos(psi_in) -sin(psi_in);sin(psi_in) cos(psi_in)];
RBW_in = [cos(delta_in) -sin(delta_in);sin(delta_in) cos(delta_in)];
RIW_in = RIB_in*RBW_in;

rA = RIB_in*rA_b + [xc_in yc_in]';
rB = RIB_in*rB_b + [xc_in yc_in]';
rC = RIB_in*rC_b + [xc_in yc_in]';
rD = RIB_in*rD_b + [xc_in yc_in]';
rE = RIB_in*rE_b + [xc_in yc_in]';
rHL1 = RIB_in*rHL1_b + [xc_in yc_in]';
rHL2 = RIB_in*rHL2_b + [xc_in yc_in]';
r1 = RIB_in*r1_b + [xc_in yc_in]';
r2 = RIB_in*r2_b + [xc_in yc_in]';
r3 = RIB_in*r3_b + [xc_in yc_in]';
r4 = RIB_in*r4_b + [xc_in yc_in]';
r1f = RIB_in*(RBW_in*r1f_w + [l1 w1]') + [xc_in yc_in]';
r1b = RIB_in*(RBW_in*r1b_w + [l1 w1]') + [xc_in yc_in]';
r2f = RIB_in*(RBW_in*r2f_w + [l1 -w1]') + [xc_in yc_in]';
r2b = RIB_in*(RBW_in*r2b_w + [l1 -w1]') + [xc_in yc_in]';
r3f = RIB_in*r3f_b + [xc_in yc_in]';
r3b = RIB_in*r3b_b + [xc_in yc_in]';
r4f = RIB_in*r4f_b + [xc_in yc_in]';
r4b = RIB_in*r4b_b + [xc_in yc_in]';


wheelaxis1b = line([r1(1) r2(1)],[r1(2) r2(2)],'Color','Black','EraseMode','Normal');
wheelaxis2b = line([r3(1) r4(1)],[r3(2) r4(2)],'Color','Black','EraseMode','Normal');
Bodyb = line([rA(1) rB(1)],[rA(2) rB(2)],'Linewidth',8.5,'EraseMode','Normal','Color','green');
Body1b = line([rD(1) rE(1)],[rD(2) rE(2)],'Linewidth',6,'EraseMode','Normal','Color',[ 0.502 1.000 1.000 ]);
Body2b = line([rC(1) rD(1)],[rC(2) rD(2)],'Linewidth',5,'EraseMode','Normal','Color','green');
%CG = line(xc_in,yc_in,'Linewidth',2,'Marker','o','Color','green','EraseMode','Normal');
wheel1b = line([r1f(1) r1b(1)],[r1f(2) r1b(2)],'Linewidth',1.5,'Color','Black','EraseMode','Normal');
wheel2b = line([r2f(1) r2b(1)],[r2f(2) r2b(2)],'Linewidth',1.5,'Color','Black','EraseMode','Normal');
wheel3b = line([r3f(1) r3b(1)],[r3f(2) r3b(2)],'Linewidth',2.5,'Color','Black','EraseMode','Normal');
wheel4b = line([r4f(1) r4b(1)],[r4f(2) r4b(2)],'Linewidth',2.5,'Color','Black','EraseMode','Normal');
HLight1b = line([rHL1(1)],[rHL1(2)],'color','yellow','marker','.','markersize',2);
HLight2b = line([rHL2(1)],[rHL2(2)],'color','yellow','marker','.','markersize',2);


for i = 1:length(tanim)
    xc_i = interp1(t,x,tanim(i));
    yc_i = interp1(t,y,tanim(i));
    psi_i = interp1(t,psi,tanim(i));
    delta_i = interp1(t,delta,tanim(i));
    

    RIB_i = [cos(psi_i) -sin(psi_i);sin(psi_i) cos(psi_i)];
    RBW_i = [cos(delta_i) -sin(delta_i);sin(delta_i) cos(delta_i)];

    rA = RIB_i*rA_b + [xc_i yc_i]';
    rB = RIB_i*rB_b + [xc_i yc_i]';
    rC = RIB_i*rC_b + [xc_i yc_i]';
    rD = RIB_i*rD_b + [xc_i yc_i]';
    rE = RIB_i*rE_b + [xc_i yc_i]';
    rHL1 = RIB_i*rHL1_b + [xc_i yc_i]';
    rHL2 = RIB_i*rHL2_b + [xc_i yc_i]';
    r1 = RIB_i*r1_b + [xc_i yc_i]';
    r2 = RIB_i*r2_b + [xc_i yc_i]';
    r3 = RIB_i*r3_b + [xc_i yc_i]';
    r4 = RIB_i*r4_b + [xc_i yc_i]';
    r1f = RIB_i*(RBW_i*r1f_w + [l1 w1]') + [xc_i yc_i]';
    r1b = RIB_i*(RBW_i*r1b_w + [l1 w1]') + [xc_i yc_i]';
    r2f = RIB_i*(RBW_i*r2f_w + [l1 -w1]') + [xc_i yc_i]';
    r2b = RIB_i*(RBW_i*r2b_w + [l1 -w1]') + [xc_i yc_i]';
    r3f = RIB_i*r3f_b + [xc_i yc_i]';
    r3b = RIB_i*r3b_b + [xc_i yc_i]';
    r4f = RIB_i*r4f_b + [xc_i yc_i]';
    r4b = RIB_i*r4b_b + [xc_i yc_i]';

wheelaxis1b = line([r1(1) r2(1)],[r1(2) r2(2)],'Color','Black','EraseMode','Normal');
wheelaxis2b = line([r3(1) r4(1)],[r3(2) r4(2)],'Color','Black','EraseMode','Normal');
Bodyb = line([rA(1) rB(1)],[rA(2) rB(2)],'Linewidth',8.5,'EraseMode','Normal','Color','green');
Body1b = line([rD(1) rE(1)],[rD(2) rE(2)],'Linewidth',6,'EraseMode','Normal','Color',[ 0.502 1.000 1.000 ]);
Body2b = line([rC(1) rD(1)],[rC(2) rD(2)],'Linewidth',5,'EraseMode','Normal','Color','green');
%CG = line(xc_in,yc_in,'Linewidth',2,'Marker','o','Color','green','EraseMode','Normal');
wheel1b = line([r1f(1) r1b(1)],[r1f(2) r1b(2)],'Linewidth',1.5,'Color','Black','EraseMode','Normal');
wheel2b = line([r2f(1) r2b(1)],[r2f(2) r2b(2)],'Linewidth',1.5,'Color','Black','EraseMode','Normal');
wheel3b = line([r3f(1) r3b(1)],[r3f(2) r3b(2)],'Linewidth',2.5,'Color','Black','EraseMode','Normal');
wheel4b = line([r4f(1) r4b(1)],[r4f(2) r4b(2)],'Linewidth',2.5,'Color','Black','EraseMode','Normal');
HLight1b = line([rHL1(1)],[rHL1(2)],'color','yellow','marker','.','markersize',2);
HLight2b = line([rHL2(1)],[rHL2(2)],'color','yellow','marker','.','markersize',2);



    drawnow
    pause(0.02)

end

%movie(M)
%movie2avi(M,'2Danim2','compression','Cinepak','quality',100,'fps',12)


hold on

 trajectory = plot(x,y,'linestyle',':','linewidth',1);
 set(trajectory,'color','black')
 xlabel('x(m)')
 ylabel('y(m)')
