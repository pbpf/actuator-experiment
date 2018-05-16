function sys_t1=ident_t2(t,y,lb,ub)
 options=optimoptions('ga');
 options=optimoptions(options,'Display','off');
 options = optimoptions(options,'PopulationSize', 100);
options = optimoptions(options,'ConstraintTolerance', 1e-16);
optfthis=@(x)optf2(x,t,y);
K=ga(optfthis,2,[],[],[],[],lb,ub,[],[],options);
sys_t1=tf(K(2)^2,[1,2*K(1)*K(2),K(2)^2]);
end

function ys=optf2(x,t,y)
%% 二阶模型对应的优化目标函�?
c=x(1);
wn=x(2);
ys=0;
for i=1:size(t,1)
    ti=t(i);
    yi=y(i);
    ys=ys+(yfun2(ti,c,wn)-yi)^2;
end
end

function y=yfun2(t,c,wn)
c1=-1+c^2;
c2=sqrt(c1);
e1=exp((c+c2)*t*wn);
e2=exp(2*c2*t*wn);
y=abs((1/(2*c1))*((c*c2-c*c2*e2+2*c1*e1-c1*(1+e2))/e1));
end