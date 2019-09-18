function [X] = updateAbsence(X,index,Y)
num = length(index);
for i=1:num
    sampleindex = index(i,1);
    dimensions = index(i,2);
    X(sampleindex,dimensions) = Y(sampleindex,dimensions);
end
