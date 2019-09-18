function [ datanew ] = standardizematrix(data)
%UNTITLED5 此处显示有关此函数的摘要
%   此处显示详细说明
[sample,dimension] = size(data);
datanew = data;

for i=1:dimension
    count = 0;
    sum1 = 0;
    sum2 = 0;
    for j =1:sample
        if isnan(data(j,i)) == 0
            count = count + 1;
            sum1 = sum1 + data(j,i);
            sum2 = sum2 + data(j,i)*data(j,i); 
        end
    end
    mean = sum1/count;
    std = sqrt(sum2/count);
    for m=1:sample
        if isnan(data(m,i)) == 0
            datanew(m,i) = (data(m,i)-mean)/std;
        end
    end
    
end

end

