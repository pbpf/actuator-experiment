function y=yfun2(t,c,wn)
c1=-1+c^2;
c2=sqrt(c1);
e1=exp((c+c2)*t*wn);
e2=exp(2*c2*t*wn);
y=abs((1/(2*c1))*((c*c2-c*c2*e2+2*c1*e1-c1*(1+e2))/e1));
end