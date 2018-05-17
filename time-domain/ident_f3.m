function sys_t1=ident_f3(datas,ss,lb,ub)
% options=optimoptions('ga');
options = optimoptions('ga');
%% Modify options setting
options = optimoptions(options,'InitialPopulationMatrix',[0,0,1,0,0,1]);
%options = optimoptions(options,'PopulationSize', 1000);
options = optimoptions(options,'ConstraintTolerance', 1e-6);
 options=optimoptions(options,'Display','off');
optfthis=@(x)opt(datas,ss,x(1:3),x(4:6));
K=ga(optfthis,6,[],[],[],[],lb,ub,[],[],options);
sys_t1=tf(x(1:3),x(4:6));
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
N=polyval(b,s);
D=polyval(a,s);
ew=datas-N/D;
dw=D;
r=abs(ew*dw);
end