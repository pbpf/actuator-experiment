%±ê¶¨
% ft = fittype( 'poly5' );
% opts = fitoptions( 'Method', 'LinearLeastSquares' );

files={'-1.dat','0.dat','1.dat','2.dat'};
angs=[-1,0,1,2];
means=zeros(4,4);
n=3;
ps=zeros(4,n+1);
for i=1:4
    file=files(i);
    ang=angs(i);
    datair=readdat(char(file));
    if(i~=2)
    data=removezero(datair);
    else
        data=datair(100:end,:);
    end
    meani=mean(data);
    means(i,:)=meani(6:9);
end
for k=1:4

 % opts.Weights = 1./abs(means(:,k)');

% Fit model to data.
%[p,~] = fit( angs',means(:,k), ft, opts );
 p=polyfit(angs,means(:,k)',n);
 ps(k,:)=p;
%ps(k,:)=[p.p1,p.p2,p.p3,p.p4,p.p5,p.p6];
y=polyval(p,angs);
figure(k);
 plot(angs,means(:,k)',angs,y);
% disp(k);
% disp(p);
end
%% fit
