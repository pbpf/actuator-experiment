function sys_t1=ident_t2(t,y,lb,ub)
 options=optimoptions('ga');
 options=optimoptions(options,'Display','off');
 options = optimoptions(options,'PopulationSize', 100);
options = optimoptions(options,'ConstraintTolerance', 1e-16);
optfthis=@(x)optf2(x,t,y);
K=ga(optfthis,2,[],[],[],[],lb,ub,[],[],options);
sys_t1=tf(K(2)^2,[1,2*K(1)*K(2),K(2)^2]);
end