function [missingindex] = generateabsentmatrix( data,ratio )
%UNTITLED6 此处显示有关此函数的摘要
%   此处显示详细说明
[sample,dimension] = size(data);
num = ceil(sample*dimension*ratio);
missingindex = zeros(num,2);
flag = 1;
flag2 =1;

while flag == 1 || flag2 == 1
    i=1;
    while i~= (num+1)
%         s = RandStream('mt19937ar','seed','shuffle');
%         RandStream.setGlobalStream(s);
        m = randi(sample-1,1)+1;
        n = randi(dimension,1);

        if ismember([m,n],missingindex,'rows') == 0
            missingindex(i,1) = m;
            missingindex(i,2) = n;
            i = i+1;
        end
    end
    [a,b] = size(unique(missingindex,'rows'));
    if a == num
        flag =0;
        missingindex = unique(missingindex,'rows');
        data2 = nanfilling(data,missingindex);
        nannumber = sum(isnan(data2),2);
        if ismember(dimension,nannumber) == 0 
            flag2 =0;
            missingindex = unique(missingindex,'rows');
        end
    end



end

