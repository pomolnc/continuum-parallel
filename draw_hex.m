function []=draw_hex(basal_center,basal_length,basal_width,height,rotation_matrix,color)
hold on;
l=basal_length;
w=basal_width;
h=height;
R=rotation_matrix;
T=[R,[basal_center(1);basal_center(2);basal_center(3)];0,0,0,1];%transformation matrix


b_x=[l/2,l/2,-l/2,-l/2];
b_y=[w/2,-w/2,-w/2,w/2];
b_z=[-h/2,-h/2,-h/2,-h/2];

t_x=b_x;
t_y=b_y;
t_z=b_z+h;

temp=linspace(1,1,4);

ori_b=[b_x;b_y;b_z];
hex_ori_b=[ori_b;temp];
hex_b=T*hex_ori_b;


ori_t=[t_x;t_y;t_z];
hex_ori_t=[ori_t;temp];
hex_t=T*hex_ori_t;
%draw cylindrical surface

for i=1:4
if i==4
    patch([hex_b(1,i),hex_t(1,i),hex_t(1,1),hex_b(1,1)],[hex_b(2,i),hex_t(2,i),hex_t(2,1),hex_b(2,1)],[hex_b(3,i),hex_t(3,i),hex_t(3,1),hex_b(3,1)],color);
else
    patch([hex_b(1,i),hex_t(1,i),hex_t(1,i+1),hex_b(1,i+1)],[hex_b(2,i),hex_t(2,i),hex_t(2,i+1),hex_b(2,i+1)],[hex_b(3,i),hex_t(3,i),hex_t(3,i+1),hex_b(3,i+1)],color);
end
end

patch(hex_b(1,:),hex_b(2,:),hex_b(3,:),color);%draw_basal

patch(hex_t(1,:),hex_t(2,:),hex_t(3,:),color);%draw_top
alpha(0.3);