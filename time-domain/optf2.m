function ys=optf2(x,t,y)
c=x(1);
wn=x(2);
ys=0;
for i=1:size(t,1)
    ti=t(i);
    yi=y(i);
    ys=ys+(yfun2(ti,c,wn)-yi)^2;
end
end