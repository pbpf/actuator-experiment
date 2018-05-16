function [data,headermap,header]=readdat(filename)
dataraw=importdata(filename,'\t',1);
data=dataraw.data;
header=dataraw.colheaders;
headermap=containers.Map(header,1:size(header,2));
end