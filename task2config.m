function [theta,delta,q]=task2config(endpoint,base,L,D)
% temp=endpoint-base;

% distance=(temp(1)^2+temp(2)^2)^0.5;

[theta,q]=compute_theta(endpoint,base,L,D);

temp=endpoint-q*base;

distance=(temp(1)^2+temp(2)^2)^0.5;

delta=atan2(temp(2),-temp(1));

% q=temp(3)+2*L*sin(theta)/theta+D*cos(theta);