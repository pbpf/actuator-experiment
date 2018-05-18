function sys_t1=ident_t1_2_T(t,y)
 options=optimoptions('ga');
 options=optimoptions(options,'Display','off');
% options = optimoptions(options,'InitialPopulationMatrix',[0.01,0.01]);
options = optimoptions(options,'PopulationSize', 100);
options = optimoptions(options,'ConstraintTolerance', 1e-17);
optfthis=@(x)optf3(x,t,y);
lb=[0,0,0];
ub=[0.1,inf ,inf];
K=ga(optfthis,3,[],[],[],[],lb,ub,[],[],options);
% disp(K(1));
% disp(K(1)+K(2));
%K(2)=K(1)+K(2);
%sys_t1=tf(1,[K(2)*K(3),(K(3)+K(2)),1],'inputdelay',K(1));
sys_t1=tf(K(3)^2,[1,2*K(3)*K(2),K(3)^2],'inputdelay',K(1));
end

function ys=optf3(x,t,y)
t1=x(1);
a1=x(2);%cas
a2=x(3);%wn
ys=0;
for i=1:size(t,1)
    ti=t(i);
    yi=y(i);
    if(ti>t1)
        theta=1;
    else
        theta=0;
    end
    ys=ys+(theta*yfun3(ti-t1,a1,a2)-yi)^2;
end
end

function y=yfun3(t,c,wn)
if(c>=1)
c1=-1+c^2;
c2=sqrt(c1);
e1=exp((c+c2)*t*wn);
e2=exp(2*c2*t*wn);
y=(1/(2*c1))*((c*c2-c*c2*e2+2*c1*e1-c1*(1+e2))/e1);
else
    c3=1-c^2;
    c4=sqrt(c3);
    c5=c4*t*wn;
    c6=c*t*wn;
    c7=cos(c5);
    c8=sin(c5);
    y=(c3 - (c3*c7 + c*c4*c8)*cosh(c6) + (c3*c7 + c*c4*c8)*sinh(c6))/c3;
end
end
% (-c*c2*e2img++2*(-c1)*e1real+c1+c1*e2img)*e1real+(c*c2-c*c2*e2real-2*c1*e1img+c1*e2img)*e1img
% function y=yfun3(t,a1,a2,T)
% y=(1 - a1/(exp((t - T)/a1)*(a1 - a2)) + a2/(exp((t - T)/a2)*(a1 - a2)));
% end