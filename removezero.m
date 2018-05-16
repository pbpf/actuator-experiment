function data=removezero(datar)
index=(abs(datar(:,2))>1e-6);
index2=[];
for i=1:size(index,1);
    if(index(i)>0)
        index2=[index2,i];
    end
end
data=datar(:,index2);
end