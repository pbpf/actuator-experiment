function sys_t1=ident_t1_1(t,y)
% options=optimoptions('ga');
options = optimoptions('ga');
%% Modify options setting
options = optimoptions(options,'InitialPopulationMatrix',[1,0,0]);
%options = optimoptions(options,'PopulationSize', 1000);
options = optimoptions(options,'ConstraintTolerance', 1e-6);
 options=optimoptions(options,'Display','off');
 lb=[0.8 0  0];
ub=[1.2 100 100];
optfthis=@(x)optf(x,t,y);
K=ga(optfthis,3,[],[],[],[],lb,ub,[],[],options);
sys_t1=tf(K(1),[K(3),1],'inputdelay',K(2));
end

function ys=optf(x,t,y)
% 带延迟一阶模型对应的优化目标函数
k=x(1);%增益
t1=x(2);%延迟
T=x(3);%时间常数
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

function y= yfun1(t,t1,k,T)
if(t>t1)
        theta=1;
else
        theta=0;
end
    y=k*theta*(1-exp(-(t-t1)/T));
end