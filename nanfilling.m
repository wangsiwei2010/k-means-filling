function [ datanew ] = nanfilling(data,missingindex)
%UNTITLED8 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
[num,~] = size(missingindex);
[sample,dimension] = size(data);

datanew = data;

for i=1:num
    m = missingindex(i,1);
    n = missingindex(i,2);
    datanew(m,n) = nan;
end



end

