clear;
% ps=[0.9155   -1.2375
%     0.9542   -0.3374
%     0.9718   -0.2428
%     1.0521    0.0176];
% pssmall=[   0.1297   -0.1530    0.6860   -1.0282
%    -0.0200    0.1414    0.8411   -0.1579
%    -0.0199    0.1461    0.7112   -0.2148
%    -0.0126    0.0326    0.9169    0.0526];
% 
%  ps=[0.000182160021475  -0.000837758181696   0.884495987773885  -1.088893492336734
%    0.000087985946719  -0.001235055473826   0.951128804642837  -0.095231308182055
%   -0.000006870637378   0.000565326991120   0.969148029366414  -0.307386297338343
%    0.000088444640822   0.000301663470211   1.038202755936907  -0.054078929575052];
ps=[ 1.0919    1.3513
    1.0477    0.3534
    1.0288    0.2498
    0.9504   -0.0167];
 files={'-1.dat','-2.dat','-5.dat','-10.dat','-15.dat','1.dat','2.dat','5.dat','10.dat','15.dat'};
 angs=[-1,-2,-5,-10,-15,1,2,5,10,15];
%  files={'-2.dat','-5.dat','-10.dat','-15.dat','2.dat','5.dat','10.dat','15.dat'};
%  angs=[-2,-5,-10,-15,2,5,10,15];
fi=1;
sys=[];
for k=1:4
    sysi=[];
for i=1:10
file=files(i);
ang=angs(i);
datar=readdat(char(file));
data=removezero(datar);
lb=[0 0];
ub=[inf inf];
%ident_t2(data(:,1),data(:,5+k))/ang,lb,ub)
xs1=data(:,1)-data(1,1);
%ys=polyval(ps(k,:),data(:,5+k))/ang;
datar=data(:,5+k);
ind=dfilter(datar,50);
ys=dtnormal(datar(ind));
xs=xs1(ind);
sss=ident_t3(xs,ys,lb,ub);
ys2=step(sss,xs1);
sysi=[sysi;sss];
figure(fi);
fi=fi+1;
plot(xs,ys,xs,ys2(ind));
legend('data','fit');  
end
sys=[sys,sysi]; %y=ax+b x=y-b/a
end