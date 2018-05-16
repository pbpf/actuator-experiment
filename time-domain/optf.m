function ys=optf(x,t,y)
k=x(1);
t1=x(2);
T=x(3);
ys=0;
for i=1:size(t,1)
    ti=t(i);
    yi=y(i);
    if(ti>t1)
        theta=1;
    else
        theta=0;
    end
    ys=ys+(k*theta*(1-exp(-(ti-t1)/T))-yi)^2;
end
end