clear;
ps=[ 1.0919    1.3513
    1.0477    0.3534
    1.0288    0.2498
    0.9504   -0.0167];
files={'-1.dat','-2.dat','-5.dat','-10.dat','-15.dat','1.dat','2.dat','5.dat','10.dat','15.dat'};
angs=[-1,-2,-5,-10,-15,1,2,5,10,15];
sys=[];
for k=1:4
    sysi=[];
for i=1:10
file=files(i);
ang=angs(i);
datar=readdat(char(file));
data=removezero(datar);
lb=[0,0];
ub=[inf ,inf];

%ident_t2(data(:,1),data(:,5+k))/ang,lb,ub)
sysi=[sysi;ident_t3(data(:,1)-data(1,1),polyval(ps(k,:),data(:,5+k))/ang,lb,ub)];
end
sys=[sys,sysi]; %y=ax+b x=y-b/a
end