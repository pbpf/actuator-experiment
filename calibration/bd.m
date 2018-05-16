files={'-15.dat','-10.dat','-5.dat','0.dat','5.dat','10.dat','15.dat'};
angs=[-15,-10,-5,0,5,10,15];
means=zeros(7,4);
n=1;
ps=zeros(4,n+1);
for i=1:7
    file=files(i);
    ang=angs(i);
    datair=readdat(char(file));
    if(i~=4)
    data=removezero(datair);
    else
        data=datair(100:end,:);
    end
    meani=mean(data);
    means(i,:)=meani(6:9);
   fg=figure('name',[char(file),'数据分布']);

   subplot(2,2,1);
  analysis(char(file),1);
   subplot(2,2,2);
    analysis(char(file),2);
     subplot(2,2,3);
      analysis(char(file),3);
       subplot(2,2,4);
        analysis(char(file),4);
  
end
for k=1:4

p=polyfit(means(:,k)',angs,n);%ang=f(means)
ps(k,:)=p;
y=polyval(p,means(:,k)');
 figure(k+i);
  plot(means(:,k)',angs,means(:,k)',y);
  figure(k+4);
  analysis(char(file),k);
% disp(k);
% disp(p);
end
%% fit
