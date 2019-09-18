function [index] = checkindex(data,indexnum)
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
sample = size(data,1);
dimension = size(data,2);

index = zeros(indexnum,2);
c = 0;
init = 1;
for i = 1:sample
    for j = 1:dimension
        if isnan(data(i,j)) == 1
            index(init,1) = i;
            index(init,2) = j;
            init = init + 1;
            c = c+1;
        end
    end
end


end
    


