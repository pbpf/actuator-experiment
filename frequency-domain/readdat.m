function [data,headermap,header]=readdat(filename)
% 读取数据文件 返回 数据，列名映射表，列名
dataraw=importdata(filename,'\t',1);
data=dataraw.data;
header=dataraw.colheaders;
headermap=containers.Map(header,1:size(header,2));
end