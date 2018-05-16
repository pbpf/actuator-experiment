function data=removezero(datar)
index=(abs(datar(:,2))>1e-6);
in1=1;
for i=1:size(index,1)-1
    if(index(i)>0)
        break;
    else
        in1=in1+1;
    end
    
end
data=datar(in1:end-1,:);
end