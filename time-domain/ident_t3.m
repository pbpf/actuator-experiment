function sys_t1=ident_t3(t,y,lb,ub)
 options=optimoptions('ga');
 options=optimoptions(options,'Display','off');
% options = optimoptions(options,'InitialPopulationMatrix',[0.01,0.01]);
options = optimoptions(options,'PopulationSize', 100);
options = optimoptions(options,'ConstraintTolerance', 1e-17);
optfthis=@(x)optf3(x,t,y);

K=ga(optfthis,2,[],[],[],[],lb,ub,[],[],options);
% disp(K(1));
% disp(K(1)+K(2));
K(2)=K(1)+K(2);
sys_t1=tf(1,[K(1)*K(2),(K(1)+K(2)),1]);
end