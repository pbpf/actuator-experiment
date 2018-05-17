function sys_t1=ident_f1_2(datas,ss)
% options=optimoptions('ga');
options = optimoptions('ga');
%% Modify options setting
options = optimoptions(options,'InitialPopulationMatrix',[0.002,0.03,1]);
%options = optimoptions(options,'PopulationSize', 1000);
options = optimoptions(options,'ConstraintTolerance', 1e-6);
 options=optimoptions(options,'Display','off');
 % x(1:3)分母
 % x(4:6)分子
   lb=[-0.03,-0.03,1];
   ub=[0.03,0.03,1];
optfthis=@(x)opt(datas,ss,x(1:3),1);
K=ga(optfthis,3,[],[],[],[],lb,ub,[],[],options);
sys_t1=tf(1,K(1:3));
end


function j=opt(datas,ss,a,b)

sum=0;

for i=1:size(datas,1)
    r=optf(ss(i),a,b,datas(i));
    sum=sum+r^2;
end
j=sum;
end

function r=optf(s,a,b,datas)
N=polyval(b,s);%%分子
D=polyval(a,s);%%分母
ew=datas-N/D;
dw=D;
r=abs(ew*dw);
end