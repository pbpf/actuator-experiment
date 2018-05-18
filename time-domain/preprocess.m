function [t,fdata]=preprocess(data,which)
%��witch ͨ��Ԥ����
data2=removezero(data);
data3=normalization(data2(:,5+which));
findex=timeline_filter(data3,start,0.4,20,errallow);
t1=data2(31:end,1);
t=t1(findex);
t=t-t(1);
fdata=data3(findex);
% fdata=medfilt1(data3,20);
% t=data2(31:end,1);
end

function data=removezero(datar)
% 取掉0指令的对应项
index=(abs(datar(:,2))>1e-9);%第二列是指令通道
in1=1;
for i=1:size(index,1)-1
    if(index(i)>0)
        break;
    else
        in1=in1+1;
    end
end
data=datar(in1-30:end-1,:);%%ȡ�����һ���Ա������ݲ�����
%% ����ǰ30����ָ��
end

function [m,stdm]=filter_mean(ys)
%% �˳�Ұֵ��ľ�ֵ
[n1,~,bin]=histcounts(ys,3);
[~,maxi]=max(n1);
ysfd=ys(bin==maxi);
m=mean(ysfd);
stdm=std(ysfd);
end
function [ys,ys0,errallow,ysm,k]=normalization(yr)
%% ��һ��
start=31;
ys0=filter_mean(yr(1:start-1));%%��ָ���ֵ
[ysm,stdm]=filter_mean(yr(end-100:end));%%��̬��ֵ
k=(ysm-ys0);%%��ֵ
ystemp=(yr-ys0)/k;%%��ֵ
ys=ystemp(31:end);
errallow=10*stdm/k;
end

function index=timeline_filter(ys,start,drt,stablestart,starterror)
%% �ṩ�����˲����˳�Ұֵ drt=0.4 starterror=0.25 stablestart=20
before=start;
beforeindex=0;
index=true(size(ys));
for i=1:size(ys,1)
    if(abs(ys(i)-before)/(i-beforeindex)>drt)
        index(i)=false;
    elseif(i>stablestart && abs(ys(i)-1)>starterror)
        index(i)=false;
    end
end
end