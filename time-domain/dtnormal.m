function [ys,ys0,k]=dtnormal(yr)
ys0=yr(1);
ysm=mean(yr(100:end));
k=(ysm-ys0);
ys=(yr-ys0)/(ysm-ys0);
end