%RLS������С���˱�ʶ
function c=RLS_ident(us,ys,n)% u input y output
n2=2*n;
stepmax=min(1000,size(us,1));   
E=1e-9;%������  
%c=[c0,zeros(n2,stepmax-1)];%����ʶ��������ĳ�ʼֵ����С  
% e=zeros(n2,stepmax);%������ĳ�ʼֵ����С  
m=n2*2+1;
H=zeros(m,n2);
for i=1:m
     h1=[-ys(i+n-(1:n));us(i+n-(1:n))]';
     H(i,:)=h1;
end
    A=H'*H;
    B=H'*ys(2:m+1);
    c0=A\B;
    p0=A\eye(n2);
for k=n+m+1:stepmax
    h1=[-ys(k-(1:n));us(k-(1:n))];%-ys(k-1),-ys(k-2),us(k-1),us(k-2)]';  
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