function update_arc(arc,angle,T_matrix,handle)
hold on;
ang=linspace(0,angle,100);
if angle==0
    x=0.*ang;
    y=0.*ang;
    z=linspace(0,arc,100);
else
    rho=arc/angle;
    x=rho.*(1-cos(ang));
    y=0.*ang;
    z=rho.*sin(ang);
end
T=T_matrix;
temp=T*[x;y;z;linspace(1,1,100)];
X=temp(1,:);
Y=temp(2,:);
Z=temp(3,:);
% h_arc=plot3(X,Y,Z,'color',color);
set(handle,'XData',X,'YData',Y,'ZData',Z);


