function [ datanew ] = zerofilling( data,missingindex )
%UNTITLED3 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
[num,~] = size(missingindex);
[sample,dimension] = size(data);

datanew = data;

for i =1:num
    sampleindex = missingindex(i,1);
    dimensionindex = missingindex(i,2);
    datanew(sampleindex,dimensionindex) = 0;
end


end

