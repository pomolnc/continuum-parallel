function [theta,q]=compute_theta(endpoint,base, L, D)
theta_0 = 0.2; q_0=50; max_iter = 100; tol = 1e-6;


% for iter = 1:max_iter
%     f = 2*L*(1-cos(x))/x+D*sin(x);
%     res=C-f;
%     conv=res^2/(1+C^2);
%     if conv<=tol
%         break;
%     end
%     df = 2*L*(x*sin(x)+cos(x)-1)/x^2+D*cos(x);
%     dx = res/df;
%     x = x + dx;
% end
% theta=x;

theta=theta_0; q=q_0;

 for iter = 1:max_iter
u1=norm(q*base(1:2)-endpoint(1:2)) - (2*L*(1-cos(theta))/theta+D*sin(theta));
u2=q*base(3)-endpoint(3)-(2*L*sin(theta)/theta+D*cos(theta));

conv=norm([u1;u2]);
    if conv<=tol
        break;
    end

   du1dq=1/norm(q*base(1:2)-endpoint(1:2)) * ((q*base(1)-endpoint(1))*base(1)+(q*base(2)-endpoint(2))*base(2));
   du1dtheta= -(2*L*(theta*sin(theta)+cos(theta)-1)/theta^2+D*cos(theta));
   
   du2dq=base(3);
   du2dtheta=-2*L*(cos(theta)/theta-sin(theta)/theta^2)+D*sin(theta);
%    
%    
%    temp1=[theta*du1dtheta+q*du1dq;theta*du2dtheta+q*du2dq] - conv;
%    temp2=[du1dtheta , du1dq ; du2dtheta , du2dq];
% %    [theta,q]=[du1dtheta , du1dq ; du2dtheta , du2dq]\([theta*du1dtheta+q*du1dq;theta*du2dtheta+q*du2dq] - conv );
%   temp3=temp2\temp1;
%   theta=temp3(1);
  
theta = theta - 0.5*(u1*du2dq-u2*du1dq)/(du1dtheta*du2dq-du2dtheta*du1dq);

q = q - 0.5*(u2*du1dtheta-u1*du2dtheta)/(du1dtheta*du2dq-du2dtheta*du1dq);

  
  while( theta>pi)
      theta=theta-pi;
  end
  while( theta<-pi)
      theta=theta+pi;
  end
  
%   q=temp3(2);
  
end