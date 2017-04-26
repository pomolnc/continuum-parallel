function []=update_cyl(basal_center,basal_radius,height,rotation_matrix,handle)
hold on;
r=basal_radius;
h=height;
R=rotation_matrix;
T=[R,[basal_center(1);basal_center(2);basal_center(3)];0,0,0,1];%transformation matrix

t=linspace(0,2*pi,21);
b_x=r.*cos(t);
b_y=r.*sin(t);
b_z=0.*t-h/2;

t_x=b_x;
t_y=b_y;
t_z=b_z+h;

temp=linspace(1,1,21);

ori_b=[b_x;b_y;b_z];
cyl_ori_b=[ori_b;temp];
cyl_b=T*cyl_ori_b;


ori_t=[t_x;t_y;t_z];
cyl_ori_t=[ori_t;temp];
cyl_t=T*cyl_ori_t;

%draw cylindrical surface
% for i=1:20
%     patch([cyl_b(1,i),cyl_t(1,i),cyl_t(1,i+1),cyl_b(1,i+1)],[cyl_b(2,i),cyl_t(2,i),cyl_t(2,i+1),cyl_b(2,i+1)],[cyl_b(3,i),cyl_t(3,i),cyl_t(3,i+1),cyl_b(3,i+1)],color)
% end

%draw cylindrical surface
for i=1:20
     X(:,i)=[cyl_b(1,i),cyl_t(1,i),cyl_t(1,i+1),cyl_b(1,i+1)]';
     Y(:,i)=[cyl_b(2,i),cyl_t(2,i),cyl_t(2,i+1),cyl_b(2,i+1)]';
     Z(:,i)=[cyl_b(3,i),cyl_t(3,i),cyl_t(3,i+1),cyl_b(3,i+1)]';
end
% h_cyl_1=patch(X,Y,Z,'b','FaceAlpha',0.5);
% % h_cyl_b=patch(cyl_b(1,:),cyl_b(2,:),cyl_b(3,:),'b');%draw_basal
% % h_cyl_t=patch(cyl_t(1,:),cyl_t(2,:),cyl_t(3,:),'b');%draw_top
% X=[cyl_b(1,:)',cyl_t(1,:)'];
% Y=[cyl_b(2,:)',cyl_t(2,:)'];
% Z=[cyl_b(3,:)',cyl_t(3,:)'];
% h_cyl_2=patch(X,Y,Z,'b','FaceAlpha',0.5);
set(handle(1),'XData',X,'YData',Y,'ZData',Z);
X=[cyl_b(1,:)',cyl_t(1,:)'];
Y=[cyl_b(2,:)',cyl_t(2,:)'];
Z=[cyl_b(3,:)',cyl_t(3,:)'];
set(handle(2),'XData',X,'YData',Y,'ZData',Z);