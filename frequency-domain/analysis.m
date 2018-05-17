function [Am,phi]=analysis(cd,fd)
rx=mean(cd.*cd);
%disp(sqrt(2*rx));
ry=mean(fd.*fd);
rxy=mean(cd.*fd);
Am=sqrt(ry/rx);
phi=-acos(rxy/sqrt(rx*ry));
end
