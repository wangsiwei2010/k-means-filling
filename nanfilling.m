function [ datanew ] = nanfilling(data,missingindex)
%UNTITLED8 此处显示有关此函数的摘要
%   此处显示详细说明
[num,~] = size(missingindex);
[sample,dimension] = size(data);

datanew = data;

for i=1:num
    m = missingindex(i,1);
    n = missingindex(i,2);
    datanew(m,n) = nan;
end



end

