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

function ys=optf3(x,t,y)
T1=x(1);
% T2=exp(x(2));
dt=x(2);
ys=0;
for i=1:size(t,1)
    ti=t(i);
    yi=y(i);
    ys=ys+(yfun3(ti,T1,dt)-yi)^2;
end
end

function y=yfun3(t,T1,dt)

% assert t2>=t1
if(dt>1e-5)
    y=1 + T1/(exp(t/T1)*dt) - (dt + T1)/(exp(t/(dt + T1))*dt);
else
    y=1 - exp(-(t/T1)) - (dt*t^2)/(exp(t/T1)*(2*T1^3)) - t/(exp(t/T1)*T1);
end

% if(t<=0)
%     y=0;
% else
% if(dt>1e-6)
%      T2=T1+dt;
%      if(T1>1e-5)
%           y=1 + T1/(exp(t/T1)*dt) - (T1+dt)/(exp(t/T2)*dt);
%      else
%          y=1 - (T1+dt)/(exp(t/T2)*dt);
%      end
% else
% %     T=(T1+T2)/2;
% %     y=1 - exp(-(t/T)) - t/(exp(t/T)*T);
% if((t/T1)>16)
%     y1=0;
% else
%     y1=exp(-(t/T1));
% end
% 
% if(T1<1e-5||(t/T1)>100)
%     y2=0;
%     y3=0;
% else
%     y2=(dt*t^2)/(exp(t/T1)*(2*T1^3));
%     y3=t/(exp(t/T1)*T1);
% end
% 
%     y=1 - y1 - y2 - y3;
% 
% end
% end
end