% here we'll compare the three 

%function for rate of temperature change
func=@(T) 0.05625*(400-T);


%here we have calculated the stability point form previous euler file 

%step size
h=15;
%for t=1 minutes we have to calculate
n=60/h;
%initial time
t0=0;
%coloumn matrix that stores rate of temperature decrease at t(i)
F=zeros(n,1);
time=zeros(n,1);
T=zeros(n,1);

%initial value stored in column matrix
time(1)=t0;T(1)=300;F(1)=-5.625;


% ****code for explicit euler****
for i=1:n+1
    time(i+1)=t0+i*h;
    T(i+1)=T(i)+h*func(T(i));
    F(i+1)=-func(T(i+1));%function for rate of temperature decrease
end

%Temperature matrix for respective value of time matrix using euler explicit
disp(T)

%plot for rate of temperatue decrease v/s time when temperature calculated by euler explicit
figure(1)
plot(time,F)

%plot of temperature of ball v/s time when temperature calculated by euler explicit
figure(2)
plot(time,T)

%point upto which euler explicit method is stable.
hc=15;
m=60/hc;
%initial time
t0=0;
%coloumn matrix that stores rate of temperature decrease at t(i)
F=zeros(m,1);
time=zeros(m,1);
T=zeros(m,1);
%initial value stored in column matrix
time(1)=t0;T(1)=300;F(1)=-5.625;

%code for ****RK-4****
for i=1:m+1
    time(i+1)=time(1)+i*hc;
    k1=h*func(T(i));
    k2=h*func(T(i)+k1/2);
    k3=h*func(T(i)+k2/2);
    k4=h*func(T(i)+k3);
    T(i+1)=T(i)+1/6*(k1+2*k2 +2*k3 +k4);
    F(i+1)=-func(T(i+1));
end

%Temperature matrix for respective value of time matrix using RK_-4
disp(T) 

figure(2)
hold on
%plot of temperature of ball v/s time when temperature calculated by RK-4
plot(time,T)
figure(1)
hold on
%plot for rate of temperatue decrease v/s time when temperature calculated by RK-4
plot(time,F)

h = 15;
%point upto which euler explicit method is stable.
r = 4;
% 60/15

%intitial condition for rate matrix
Fi(1)=-5.625;
time = zeros(r+1,1);
T = zeros(r+1,1);
time(1) = 0;
T(1) = 300;
tol= 10^-8;
x = 0;
Temp = 300;

%code for ****implicit euler****
for i = 2:6
    Told = Temp;
    f = getf(Temp,Told,h);
    while abs(f) > tol
        Temp = Temp -(f/(getdf(Temp,h)));
        f = getf(Temp,Told,h);
    end
    x = x + h;
    time(i) = x;
    T(i) = Temp;
    Fi(i)=-func(T(i));
end


%Temperature matrix for respective value of time matrix using implicit
disp(T) 

figure(2)
hold on
%plot of temperature of ball v/s time when temperature calculated by
%implicit
plot(time,T)
title(' Rate of Temperature Change vs Time')
xlabel('Time(second)')
ylabel(' Rate of Temperature Change')
figure(1)
hold on
%plot for rate of temperatue decrease v/s time when temperature calculated
%by implicit
plot(time,Fi)
title('Temperature vs Time')
xlabel('Time(second)')
ylabel('Temperature')


%function for rate of temperature change
function f = getf(Temp,Told,h)
 f = Temp - Told -h*(0.05625*(400-Temp));
end
function df = getdf(Temp,h)
df =  1 + h*0.05625;
end




