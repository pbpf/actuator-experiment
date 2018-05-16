function sys_t1=ident_t1(t,y,lb,ub)
% options=optimoptions('ga');
options = optimoptions('ga');
%% Modify options setting
options = optimoptions(options,'InitialPopulationMatrix',[1,0,0]);
%options = optimoptions(options,'PopulationSize', 1000);
options = optimoptions(options,'ConstraintTolerance', 1e-6);
 options=optimoptions(options,'Display','off');
optfthis=@(x)optf(x,t,y);
K=ga(optfthis,3,[],[],[],[],lb,ub,[],[],options);
sys_t1=tf(K(1),[K(3),1],'inputdelay',K(2));
end