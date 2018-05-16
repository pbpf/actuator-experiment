function data=datars(ps,datar)
pssmall=[   0.1297   -0.1530    0.6860   -1.0282
   -0.0200    0.1414    0.8411   -0.1579
   -0.0199    0.1461    0.7112   -0.2148
   -0.0126    0.0326    0.9169    0.0526];

data=datar;
if(datar(1,2)>-2&&datar(1,2)<3)
    data(:,2)=polyval(pssmall(1,:),datar(:,2));
else
data(:,2)=polyval(ps(1,:),datar(:,2));
end
data(:,3)=polyval(ps(2,:),datar(:,3));
data(:,4)=polyval(ps(3,:),datar(:,4));
data(:,5)=polyval(ps(4,:),datar(:,5));
end