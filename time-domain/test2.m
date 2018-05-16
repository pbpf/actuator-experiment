%test1
clear;
close all;
files={'-1.dat','-2.dat','-5.dat','-10.dat','-15.dat','1.dat','2.dat','5.dat','10.dat','15.dat'};
angs=[-1,-2,-5,-10,-15,1,2,5,10,15];
sys=[];%%����ȫ���Ĵ��ݺ���
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
legend('����1','����2','����3','����4','����5','����6','����7','����8','����9','����10');
title(sprintf('���%d����',k));
end
[yy,tt]=step(systhis,0:0.01:t(end));
subplot(2,4,k+4);
plot(tt,yy);hold on;
xlim([0.000 0.503])
ylim([0.00 1.19])
if(i==10)
title(sprintf('���%dģ��',k));
legend('ģ��1','ģ��2','ģ��3','ģ��4','ģ��5','ģ��6','ģ��7','ģ��8','ģ��9','ģ��10');
end
end
sys=[sys,sysi];
end