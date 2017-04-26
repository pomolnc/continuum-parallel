function [theta1,delta1,q1,theta2,delta2,q2,theta3,delta3,q3]=inverse_kinematics(end_position,r,L,D,alpha)

%%
% L=200;
% D=200;
% 
% x=100;
% y=130;
% z=-400;
% P=[x;y;z];

% r=50;
% R=250;

P=end_position;

r1=[r;0;0];
r2=[r*cosd(120);r*sind(120);0];
r3=[r*cosd(240);r*sind(240);0];

% alpha=pi/4;
% R1=[R;0;0];
% R2=[R*cosd(120);R*sind(120);0];
% R3=[R*cosd(240);R*sind(240);0];
R1=[cos(alpha)*cosd(0);cos(alpha)*sind(0);sin(alpha)];
R2=[cos(alpha)*cosd(120);cos(alpha)*sind(120);sin(alpha)];
R3=[cos(alpha)*cosd(240);cos(alpha)*sind(240);sin(alpha)];


% fun1=inline('P+r1+[2*L*(1-cos(x(1)))*cos(x(2))/x(1)+D*sin(x(1))*cos(x(2)) ; 2*L*(cos(x(1))-1)*sin(x(2))/x(1)-D*sin(x(1))*cos(x(2)); 2*L*sinx(1)/x(1)+D*cos(x(1))]-R1-[0;0;x(3)]','x');

theta=zeros(3,1);
delta=zeros(3,1);
q=zeros(3,1);
for i=1:3
    x0=[0.5;0.5;200];
endpoint=[P+r1,P+r2,P+r3];
base=[R1,R2,R3];
[theta_temp,delta_temp,q_temp]=task2config(endpoint(:,i),base(:,i),L,D);
theta(i)=theta_temp/pi*180;
delta(i)=delta_temp/pi*180;
q(i)=q_temp;

end

theta1=theta(1);
theta2=theta(2);
theta3=theta(3);
delta1=delta(1);
delta2=delta(2);
delta3=delta(3);
q1=q(1);
q2=q(2);
q3=q(3);
