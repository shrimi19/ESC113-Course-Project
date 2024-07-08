f=@(T) 0.05625*(400-T);%function for rate of temperature change

h=5;%step size
n=60/h;%for t=1 minutes we have to calculate
t0=0;%initial time
F=zeros(n,1);%coloumn matrix that stores rate of temperature decrease at t(i)
time=zeros(n,1);
T=zeros(n,1);
time(1)=t0;T(1)=300;F(1)=-5.625;
%code for explicit euler
for i=1:n+1
    time(i+1)=t0+i*h;
    T(i+1)=T(i)+h*f(T(i));
    F(i+1)=-f(T(i+1));
end
figure(1)%plot for rate of temperatue decrease v/s time
plot(time,F)
hold on
figure(2)%plot of temperature of ball v/s time
plot(time,T)

hc=15;%point upto which euler explicit method is stable.
