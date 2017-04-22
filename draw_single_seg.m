function [backbone_0,backbone_1,backbone_2,backbone_3,backbone_4,disk_b1,disk_b2,coor_b1,coor_b2,coor_b3,disk_g1,disk_g2,coor_g1,coor_g2,coor_g3,disk_m1,disk_m2,coor_m1,coor_m2,coor_m3]=draw_single_seg(theta,delta,L,T_matrix,radius)
beta=pi/2;
R_tc=R_z(-delta);
R_tg=R_z(-delta)*R_y(pi/2-theta)*R_z(delta);

if theta==pi/2
    L_0=L;
    L_1=L;
    L_2=L;
    L_3=L;
    L_4=L;
else
    rho_0=L/(pi/2-theta);
    L_0=L;
    rho_1=rho_0-radius*cos(0*beta-delta);
    L_1=rho_1*(pi/2-theta);   
    rho_3=rho_0-radius*cos(2*beta-delta);
    L_3=rho_3*(pi/2-theta); 
    rho_2=rho_0-radius*sin(0*beta-delta);
    L_2=rho_2*(pi/2-theta); 
    rho_4=rho_0-radius*sin(2*beta-delta);
    L_4=rho_4*(pi/2-theta); 
end

%draw primary backbone
T_c0=T_matrix*[R_tc,[0;0;0];0,0,0,1];
backbone_0=draw_arc(L_0,pi/2-theta,T_c0,[0.9;0.9;0.9]);

%draw 1st&3rd secondry backbones
origin_1=radius*[cos(0*beta);sin(0*beta);0];
T_c1=T_matrix*[R_tc,origin_1;0,0,0,1]; 
backbone_1=draw_arc(L_1,pi/2-theta,T_c1,[1;0;0]);

origin_3=radius*[cos(2*beta);sin(2*beta);0];
T_c3=T_matrix*[R_tc,origin_3;0,0,0,1];
backbone_3=draw_arc(L_3,pi/2-theta,T_c3,[1;0;0]);

%draw 2rd&4th secondry backbones
origin_2=radius*[cos(1*beta);sin(1*beta);0];
T_c2=T_matrix*[R_tc,origin_2;0,0,0,1];
backbone_2=draw_arc(L_2,pi/2-theta,T_c2,[0;0;1]);

origin_4=radius*[cos(3*beta);sin(3*beta);0];
T_c4=T_matrix*[R_tc,origin_4;0,0,0,1];
backbone_4=draw_arc(L_4,pi/2-theta,T_c4,[0;0;1]);

%draw disk
[disk_b1,disk_b2]=draw_cyl(T_matrix(1:3,4),1.05*radius,0.1,T_matrix(1:3,1:3),[0.2;0.2;0.2]);
[coor_b1,coor_b2,coor_b3]=draw_coordinate(radius,T_matrix(1:3,1:3),T_matrix(1:3,4),'rgb');

if theta==pi/2
    P_g=[0;0;L];
else
P_g=rho_0*[(1-sin(theta))*cos(-delta);(1-sin(theta))*sin(-delta);cos(theta)];
end
[disk_g1,disk_g2]=draw_cyl(T_matrix*[P_g;1],1.05*radius,0.1,T_matrix(1:3,1:3)*R_tg,[0.2;0.2;0.2]);
[coor_g1,coor_g2,coor_g3]=draw_coordinate(radius,T_matrix(1:3,1:3)*R_tg,T_matrix*[P_g;1],'rgb');

if theta==pi/2
    P_m=[0;0;L/2];
else
P_m=rho_0*[(1-sin(pi/4+theta/2))*cos(-delta);(1-sin(pi/4+theta/2))*sin(-delta);cos(pi/4+theta/2)];
end
R_tm=R_z(-delta)*R_y(pi/4-theta/2)*R_z(delta);
[disk_m1,disk_m2]=draw_cyl(T_matrix*[P_m;1],1.05*radius,0.1,T_matrix(1:3,1:3)*R_tm,[0.2;0.2;0.2]);
[coor_m1,coor_m2,coor_m3]=draw_coordinate(radius,T_matrix(1:3,1:3)*R_tm,T_matrix*[P_m;1],'rgb');

axis equal
grid on

