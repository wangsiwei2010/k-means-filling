clear
loadpath = 'E:/vincent/dataset';
resultpath = 'E:/vincent/results';
dataname = 'avila';   %%ovarian10-90;wine10-60;glass10-60;cancer10-50

originmatrix = load([loadpath,'/',dataname,'/',dataname,'_dataset.mat']);

ratio = [10:10:40];

%%targets = originmatrix.wineTargets';
%%data = originmatrix.data;
data = originmatrix.datamatrix;

targets = data(:,11);
targets = double(targets);
targets(isnan(targets))=2;
truelabel = targets;
% [sample,~] = size(targets);
% for i =1:1:sample
%     [,label]=find(targets(i,:));
%     targets(i,1) = label;
% end
% truelabel = targets(:,1);
% idx = find(truelabel == 0);
% truelabel(idx) = 10;
%%truelabel = targets(:,1);
classnumber = length(unique(targets));

times = 5;

accval1 = zeros(length(times),1);
nmival1 = zeros(length(times),1);
Fmval1 = zeros(length(times),1);
adjval1 = zeros(length(times),1);

accval2 = zeros(length(times),1);
nmival2 = zeros(length(times),1);
Fmval2 = zeros(length(times),1);
adjval2 = zeros(length(times),1);

accval3 = zeros(length(times),1);
nmival3 = zeros(length(times),1);
Fmval3 = zeros(length(times),1);
adjval3 = zeros(length(times),1);

accval4 = zeros(length(times),1);
nmival4 = zeros(length(times),1);
Fmval4 = zeros(length(times),1);
adjval4 = zeros(length(times),1);

accval5 = zeros(length(times),1);
nmival5 = zeros(length(times),1);
Fmval5 = zeros(length(times),1);
adjval5 = zeros(length(times),1);


accval6 = zeros(length(times),1);
nmival6 = zeros(length(times),1);
Fmval6 = zeros(length(times),1);
adjval6 = zeros(length(times),1);

res = zeros(4,6);

for m=1:length(ratio)
    data = load([loadpath,'/',dataname,'/',dataname,'_missing_',num2str(ratio(m)),'.mat']);
    data = data.absentmatrix;
    data = double(data);

    sample = size(data,1);
    dimension =size(data,2);
    indexnum = ceil(sample*dimension*ratio(m)/100);
    missingindex = checkindex(data,indexnum);

    for i =1:times
        %%k-means野割

        %%datanew = standardizematrix(data);
        %%datanew = zerofilling(datanew,missingindex);
        %%datanew = meanfilling(data,missingindex);
        datanew = DataCompletion(data,'KNN');
        [centers,assignment,goalvalue] = kmeansfilling(datanew,classnumber,missingindex,times);
        res1 = myNMIACC(assignment,truelabel);
        accval1(i,1) = res1(1);
        nmival1(i,1)= res1(2);
        Fmval1(i,1) = res1(3);
        
        %%NMF野割
        [assignment1,goal] = nmffilling(missingindex,data,classnumber);
        res2 = myNMIACC(assignment1,truelabel);
        accval2(i,1) = res2(1);
        nmival2(i,1)= res2(2);
        Fmval2(i,1) = res2(3);

        %%knn野割
        X1 = DataCompletion(data,'KNN');
        assignment3 = kmeans(X1,classnumber);
        res3 = myNMIACC(assignment3,truelabel);
        accval3(i,1) = res3(1);
        nmival3(i,1)= res3(2);
        Fmval3(i,1) = res3(3);

        %%EM野割
        X2 = DataCompletion(data,'EM');
        assignment4 = kmeans(X2,classnumber);
        res4 = myNMIACC(assignment4,truelabel);
        accval4(i,1) = res4(1);
        nmival4(i,1)= res4(2);
        Fmval4(i,1) = res4(3);

        %%譲峙野割
        X3 = meanfilling(data,missingindex);
        assignment5 = kmeans(X3,classnumber);
        res5 = myNMIACC(assignment5,truelabel);
        accval5(i,1) = res5(1);
        nmival5(i,1)= res5(2);
        Fmval5(i,1) = res5(3);

        %%0野割
        X4 = standardizematrix(data);
        X4 = zerofilling(X4,missingindex);
        assignment6 = kmeans(X4,classnumber);
        res6 = myNMIACC(assignment6,truelabel);
        accval6(i,1) = res6(1);
        nmival6(i,1)= res6(2);
        Fmval6(i,1) = res6(3);
    end
    

    res(1,1) = max(accval1);
    res(2,1) = max(nmival1);
    res(3,1) = max(Fmval1);

    res(1,2) = max(accval2);
    res(2,2) = max(nmival2);
    res(3,2) = max(Fmval2);

    res(1,3) = max(accval3);
    res(2,3) = max(nmival3);
    res(3,3) = max(Fmval3);

    res(1,4) = max(accval4);
    res(2,4) = max(nmival4);
    res(3,4) = max(Fmval4);

    res(1,5) = max(accval5);
    res(2,5) = max(nmival5);
    res(3,5) = max(Fmval5);

    res(1,6) = max(accval6);
    res(2,6) = max(nmival6);
    res(3,6) = max(Fmval6);

    save([resultpath,'/',dataname,'/',dataname,'_missing_',num2str(ratio(m)),'.mat'],'res')
end
