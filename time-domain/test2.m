%test1
clear;
close all;
files={'-1.dat','-2.dat','-5.dat','-10.dat','-15.dat','1.dat','2.dat','5.dat','10.dat','15.dat'};
angs=[-1,-2,-5,-10,-15,1,2,5,10,15];
sys=[];%%计算全部的传递函数
for k=1:4
    sysi=[];
for i=1:10
file=files(i);
ang=angs(i);
datar=readdat(char(file));
[t,dataf]=preprocess(datar,k);
lb=[0.1 0];
ub=[1.5 inf];
systhis=ident_t2(t,dataf,lb,ub);
sysi=[sysi;systhis];
subplot(2,4,k);
plot(t,dataf);hold on;
xlim([0.000 0.503])
ylim([0.00 1.19])
if(i==10)
legend('数据1','数据2','数据3','数据4','数据5','数据6','数据7','数据8','数据9','数据10');
title(sprintf('舵机%d数据',k));
end
[yy,tt]=step(systhis,0:0.01:t(end));
subplot(2,4,k+4);
plot(tt,yy);hold on;
xlim([0.000 0.503])
ylim([0.00 1.19])
if(i==10)
title(sprintf('舵机%d模型',k));
legend('模型1','模型2','模型3','模型4','模型5','模型6','模型7','模型8','模型9','模型10');
end
end
sys=[sys,sysi];
end