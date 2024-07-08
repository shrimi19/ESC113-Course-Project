% here we are going to solve the governing first order energy balance
% equation gor predicting the temperature of the sphere at different step
% sizes of time.

%uncomment to solve for diff values of step size and corresponding n for
%given step size
%h = 10; n = 6;
% h = 5;n = 12;
x0 = 0; y0 = 300;
[xout,yout,K1,K2,K3,K4] = rk_4(x0,y0,h,n);
T_at_required_time = yout(n+1,1);

%plot k1,k2,k3,k4 change
for i = 1:n
x_value(i,:) = xout(i+1,:);
end
plot(x_value,K1);
hold on
plot(x_value,K2);
hold on
plot(x_value,K3);
hold on
plot(x_value,K4);
 
%now to calculate rate of temperature decrease
%for t =0;
   rate_1 = getf(yout(1));
%for t = 0.5 min
   rate_2 = getf(yout(1+(0.5*60)/h));
% for t = 1.0 min
   rate_3 = getf(yout(1+(1*60)/h));

%writing the given first order differential equation
function f = getf(y)
%introducing constants:
c_p = 400; %Specific Heat in constant pressure
ro = 8000; %density of ball
k = 40; % thermal conductivity
H = 3000; %convective heat transfer coefficient
a = 3/0.05; %here in given question radius of sphere is 5cm a = surface area/volume
t0 = 400; % temparutre of medium or t(inf)
f = -H*a*(y-t0)*(1/ro)*(1/c_p);
%here  y is the variable temperature
end


%now we will solve the differential equation by runga-kutta 4 method
function [xout,yout,K1,K2,K3,K4] = rk_4(x0,y0,h,n)
xout = zeros(n+1,1);
yout = zeros(n+1,1);
xout(1) = x0;
yout(1) = y0;
x = x0;
y =y0;
for i = 2:n+1
     k1 = getf(y);
     k2 = getf( y + 0.5*k1*h);
     k3 = getf(y + 0.5*k2*h);
     k4  = getf(y+k3*h);
     y = y + (h/6)*(k1 + 2*k2 + 2*k3 + k4);
     x = x +h;
     K1(i-1) = k1;
     K2(i-1) = k2;
     K3(i-1) = k3;
     K4(i-1) = k4;
     xout(i) = x;
     yout(i) = y;
end
end