% big test
function []=analysis(file,k)% ps是标定矩阵
data=readdat(file);
% data=removezero(data);
datar=data(:,5+k);
[n1,y1]=hist(datar,100);
bar(y1,n1);
% nmax=max(n1);
% for i = 1:length(y1)  
%     if(n1(i)>0)
%       text(y1(i),n1(i)+1+floor(nmax*0.05),num2str(polyval(ps(k,:),y1(i))),'Color','r');  
%     end
% end  
% title(['数据分布 c=',num2str(data(1,1+k)),',最高点最接近该值说明数据有效,否则无效']);

end