% target=[-00;180;-300];
h=-278;
% target=[00;00;h-100];
target=[-90;68;-328.1957];
% R=200;
r=20;

% D=200;
D=390;
L=(500-D)/2;

r1=[r;0;0];
r2=[r*cosd(120);r*sind(120);0];
r3=[r*cosd(240);r*sind(240);0];
endpoint=[target+r1,target+r2,target+r3];

% alpha=pi/4;
alpha=52/180*pi;

% R1=[R;0;0];
% R2=[R*cosd(120);R*sind(120);0];
% R3=[R*cosd(240);R*sind(240);0];
R1=[cos(alpha)*cosd(0);cos(alpha)*sind(0);sin(alpha)];
R2=[cos(alpha)*cosd(120);cos(alpha)*sind(120);sin(alpha)];
R3=[cos(alpha)*cosd(240);cos(alpha)*sind(240);sin(alpha)];


draw_coordinate(100,eye(3),[0;0;0],'rgb');
draw_coordinate(40,eye(3),target,'rgb');
% draw_coordinate(40,eye(3),R1,'rgb');
% draw_coordinate(40,eye(3),R2,'rgb');
% draw_coordinate(40,eye(3),R3,'rgb');

draw_cyl(target,r+20,5,eye(3),[0.2,0.2,0.2]);

draw_cyl(R1*300,5,600,R_z(0)*R_y(pi/2-alpha),[0.5,0.5,0.5]);
draw_cyl(R2*300,5,600,R_z(2/3*pi)*R_y(pi/2-alpha),[0.5,0.5,0.5]);
draw_cyl(R3*300,5,600,R_z(4/3*pi)*R_y(pi/2-alpha),[0.5,0.5,0.5]);

draw_cyl([0,0,h-50],150,100,R_z(0),[0.3,0.8,0.3]);

[theta1,delta1,q1,theta2,delta2,q2,theta3,delta3,q3]=inverse_kinematics(target,r,L,D,alpha);
theta=[theta1;theta2;theta3];
delta=[delta1;delta2;delta3];
q=[q1;q2;q3];

for i=1:3
    continuum_chain(theta(i)*pi/180,delta(i)*pi/180,L,D,endpoint(:,i));
end


axis([-500,500,-500,500,-800,400])
% axis equal 
view(22,20)