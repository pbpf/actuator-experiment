function ys=optf3(x,t,y)
T1=x(1);
% T2=exp(x(2));
dt=x(2);
ys=0;
for i=1:size(t,1)
    ti=t(i);
    yi=y(i);
    ys=ys+(yfun3(ti,T1,dt)-yi)^2;
end
end