% big test
function []=analysis(file,k)% ps�Ǳ궨����
data=readdat(file);
data=removezero(data);
x1=data(:,1)-data(1,1);
datar=data(:,5+k);
[n1,y1]=hist(datar,100);
subplot(2,1,1);
bar(y1,n1);hold on;
% nmax=max(n1);
% for i = 1:length(y1)  
%     if(n1(i)>0)
%       text(y1(i),n1(i)+1+floor(nmax*0.05),num2str(polyval(ps(k,:),y1(i))),'Color','r');  
%     end
% end  
% title(['���ݷֲ� c=',num2str(data(1,1+k)),',��ߵ���ӽ���ֵ˵��������Ч,������Ч']);
ind=dfilter(datar,50);
[y,y0,aa]=dtnormal(datar(ind));
x=x1(ind);
ss=ident_t3(x,y,[0 0],[inf inf]);
y2=step(ss,x1);
y2=y2(ind);
subplot(2,1,2)
plot(x1,(datar-y0)/aa,x,y,x,y2);
legend('ԭʼ����','�˺�����','��ʶ');  
title('�˳�Ұֵ');
end