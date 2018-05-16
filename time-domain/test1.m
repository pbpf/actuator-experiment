%test1
clear;
ps=[ 1.0919    1.3513
    1.0477    0.3534
    1.0288    0.2498
    0.9504   -0.0167];
files={'-1.dat','-2.dat','-5.dat','-10.dat','-15.dat','1.dat','2.dat','5.dat','10.dat','15.dat'};
angs=[-1,-2,-5,-10,-15,1,2,5,10,15];
sys=[];%%计算全部的传递函数
for k=1:4
    sysi=[];
for i=1:10
file=files(i);
ang=angs(i);
datar=readdat(char(file));
data=removezero(datar);
lb=[0.8 0  0];
ub=[1.2 100 100];
sysi=[sysi;ident_t1(data(:,1)-data(1,1),polyval(ps(k,:),data(:,5+k))/ang,lb,ub)];
end
sys=[sys,sysi];
end

