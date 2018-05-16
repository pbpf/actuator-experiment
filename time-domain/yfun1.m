function y= yfun1(t,t1,k,T)
if(t>t1)
        theta=1;
else
        theta=0;
end
    y=k*theta*(1-exp(-(t-t1)/T));
end