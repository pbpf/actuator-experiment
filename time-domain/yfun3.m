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