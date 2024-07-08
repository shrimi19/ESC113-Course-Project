%here we will try to solve for implict euler


%uncomment to choose step size
% h =5;
%h = 10;
% h = 15;

n = 60/h;

%initial conditions
t0 = 0;
T0 =300;

%here we calculate corresponding temperature for given time
[time,temp] = implicit_method(t0,T0,n,h);

%now lets solve for temperature and time
plot(time,temp);

%function for rate of temperature change
function f = getf(T,Told,h)
 f = T - Told -h*(0.05625*(400-T));
end
function df = getdf(T,h)
df =  1 + h*0.05625;
end

function [time,temp] = implicit_method(t0,T0,n,h)
time = zeros(n+1,1);
temp = zeros(n+1,1);
time(1) = t0;
temp(1) = T0;
tol= 10^-8;
x = t0;
T = T0;
for i = 2:n+1
    Told = T;
    f = getf(T,Told,h);
    while abs(f) > tol
        T = T -(f/(getdf(T,h)));
        f = getf(T,Told,h);
    end
    x = x + h;
    time(i) = x;
    temp(i) = T;
end
end


