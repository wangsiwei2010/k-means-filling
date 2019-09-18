function [ data ] = updatefilling(data,U,labels_u,index)
%UNTITLED3 更新填充值
%   此处显示详细说明
[num,~]=size(index);
for i=1:num
    sampleindex = index(i,1);
    dimensionindex = index(i,2);
    label = labels_u(sampleindex);
    data(sampleindex,dimensionindex) = U(label,dimensionindex);
end
end

