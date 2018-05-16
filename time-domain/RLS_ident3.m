function c=RLS_ident3(us,ys,n)% u input y output
n2=n+n;
stepmax=min(1000,size(us,1));
c0=ones(1,n2)'*0.01;  
p0=10^6*eye(n2,n2);  
E=1e-9;%������  
%c=[c0,zeros(n2,stepmax-1)];%����ʶ��������ĳ�ʼֵ����С  
% e=zeros(n2,stepmax);%������ĳ�ʼֵ����С  
for k=n+1:stepmax
    h1=[-ys(k-1),us(k-1)]';  
    k0=(h1'*p0*h1+1)\p0*h1;%���K��ֵ  
    new=ys(k)-h1'*c0;   
    c1=c0+k0*new;%�󱻱�ʶ����c  
    p1=p0-k0*h1'*p0;  
    e1=(c1-c0)./c0;%�������ǰֵ����һ�ε�ֵ�Ĳ�ֵ  
    c0=c1;%�»�õĲ�����Ϊ��һ�ε��Ƶľɲ���  
    p0=p1;  
    if norm(e1)<=E   
        break;%��������������Ҫ����ֹ����  
    end  
end
disp(norm(e1));
c=c0;
end