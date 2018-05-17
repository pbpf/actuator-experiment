function [t,cmddata,fdata]=preprocess(data,which,n)
%对witch 通道预处理
data1=removezero(data);
base=filter_mean(data1(1:30,5+which));
data2=data1(31:end,5+which)+base;
%[data3,start,errallow]=normalization(data2(:,5+which));
%findex=timeline_filter(data3,start,0.4,20,errallow);
%t1=data2(31:end,1);
t1=data1(31:end,1);
%t=t1(findex);
t=t1-t1(1);
%fdata=data3(findex);
dataf=data2;
if(n<=0)
 fdata=dataf;
else
fdata=medfilt1(dataf,n);
end
meanf=mean(fdata);%%调整为0均值
fdata=fdata-meanf;

% plot(t,dataf);hold on;
% plot(t,fdata);
cmddata=data1(31:end,1+which);
end

function data=removezero(datar)
% 鍙栨帀0鎸囦护鐨勫搴旈」
index=(abs(datar(:,2))>1e-9);%绗簩鍒楁槸鎸囦护閫氶亾
in1=1;
for i=1:size(index,1)-1
    if(index(i)>0)
        break;
    else
        in1=in1+1;
    end
end
data=datar(in1-30:end-1,:);%%取掉最后一行以避免数据不完整
end

function [m,stdm]=filter_mean(ys)
%% 滤除野值后的均值
[n1,~,bin]=histcounts(ys,3);
[~,maxi]=max(n1);
ysfd=ys(bin==maxi);
m=mean(ysfd);
stdm=std(ysfd);
end
function [ys,ys0,errallow,ysm,k]=normalization(yr)
%% 归一化
start=31;
ys0=filter_mean(yr(1:start-1));%%零指令均值
[ysm,stdm]=filter_mean(yr(end-100:end));%%稳态均值
k=(ysm-ys0);%%幅值
ystemp=(yr-ys0)/k;%%新值
ys=ystemp(31:end);
errallow=10*stdm/k;
end

function index=timeline_filter(ys,start,drt,stablestart,starterror)
%% 提供众数滤波，滤除野值 drt=0.4 starterror=0.25 stablestart=20
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