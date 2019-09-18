function [ datanew ] = meanfilling( data,missingindex)
%UNTITLED4 此处显示有关此函数的摘要
%   此处显示详细说明
[num,~] = size(missingindex);
[sample,dimension] = size(data);

datanew = data;

for i=1:dimension
    num = 0;
    sum = 0; 
    for j =1:sample
        if isnan(data(j,i)) == 0
            num = num+1;
            sum = sum + data(j,i);
        end
    end
    value = sum/num;
    for m=1:sample
        if isnan(data(m,i)) == 1
            datanew(m,i) = value;
        end
    end
    
end

end

