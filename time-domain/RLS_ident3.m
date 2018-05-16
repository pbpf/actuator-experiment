function c=RLS_ident3(us,ys,n)% u input y output
n2=n+n;
stepmax=min(1000,size(us,1));
c0=ones(1,n2)'*0.01;  
p0=10^6*eye(n2,n2);  
E=1e-9;%相对误差  
%c=[c0,zeros(n2,stepmax-1)];%被辨识参数矩阵的初始值及大小  
% e=zeros(n2,stepmax);%相对误差的初始值及大小  
for k=n+1:stepmax
    h1=[-ys(k-1),us(k-1)]';  
    k0=(h1'*p0*h1+1)\p0*h1;%求出K的值  
    new=ys(k)-h1'*c0;   
    c1=c0+k0*new;%求被辨识参数c  
    p1=p0-k0*h1'*p0;  
    e1=(c1-c0)./c0;%求参数当前值与上一次的值的差值  
    c0=c1;%新获得的参数作为下一次递推的旧参数  
    p0=p1;  
    if norm(e1)<=E   
        break;%若参数收敛满足要求，终止计算  
    end  
end
disp(norm(e1));
c=c0;
end