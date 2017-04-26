function []=continuum_chain(theta,delta,L,D,base_position)

%% manipulator
theta_1=pi/2-theta;
% theta_1=theta;
theta_2=pi/2;
theta_3=theta_1;

delta_1=delta;
delta_2=0;
delta_3=pi+delta_1;

L_1=L;
L_2=D;
L_3=L;
% calculation
if theta_1==pi/2
    P_1g=[0;0;L_1];
else
    P_1g=(L_1/(pi/2-theta_1))*[cos(delta_1)*(1-sin(theta_1));sin(delta_1)*(sin(theta_1)-1);cos(theta_1)];
end
if theta_2==pi/2
    P_2g=[0;0;L_2];
else
    P_2g=(L_2/(pi/2-theta_2))*[cos(delta_2)*(1-sin(theta_2));sin(delta_2)*(sin(theta_2)-1);cos(theta_2)];
end
if theta_3==pi/2
    P_3g=[0;0;L_3];
else
    P_3g=(L_3/(pi/2-theta_3))*[cos(delta_3)*(1-sin(theta_3));sin(delta_3)*(sin(theta_3)-1);cos(theta_3)];
end
R_b=eye(3);
R_1g=R_z(-1*delta_1)*R_y(pi/2-theta_1)*R_z(1*delta_1);
R_2g=R_z(-1*delta_2)*R_y(pi/2-theta_2)*R_z(1*delta_2);
R_3g=R_z(-1*delta_3)*R_y(pi/2-theta_3)*R_z(1*delta_3);
R_1b=R_b;
R_2b=R_1b*R_1g;
R_3b=R_2b*R_2g;
R_4b=R_3b*R_3g;
% T_b=[R_b,[0;0;0];0,0,0,1];
 T_b=[R_b,base_position;0,0,0,1];
T_1=T_b;
P_1g_b=T_1*[P_1g;1];
P_2b_b=P_1g_b;
T_2=[R_2b,P_2b_b(1:3,1);];
P_2g_b=T_2*[P_2g;1];
P_3b_b=P_2g_b;
T_3=[R_3b,P_3b_b(1:3,1);];
P_3g_b=T_3*[P_3g;1];

[a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15,a16,a17,a18,a19,a20]=draw_single_seg(theta_1,delta_1,L_1,T_1,10);

[b1,b2,b3,b4,b5,b6,b7,b8,b9,b10,b11,b12,b13,b14,b15,b16,b17,b18,b19,b20]=draw_single_seg(theta_2,delta_2,L_2,T_2,10);

[c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15,c16,c17,c18,c19,c20]=draw_single_seg(theta_3,delta_3,L_3,T_3,10);

% draw_cyl(P_3g_b+[0;0;100],10,200,eye(3),[0.9,0.9,0]);