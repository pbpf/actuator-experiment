function index=dfilter(ys,n)
[n1,y1]=hist(ys,2*n);
[~,maxi]=max(n1);
start1=ys(1);
mn=y1(maxi);%%ÖÚÊı
dt=abs(mn-start1)*0.2;
 if(mn>start1)
     indext=ys<(mn+dt);
 else
     indext=ys>(mn-dt);
 end
indext1=abs(ys-mn)<dt;
indext1(1:20)=1;
indext=~((~indext)|(~indext1));
index=[];
i=1;
for pi=indext'
    if(pi>0)
        index=[index,i];
    end
    i=i+1;
end
end