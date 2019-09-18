clear;

loadpath = 'E:/vincent/dataset';
resultpath = 'E:/vincent/results';
dataname = 'RCV1';

originmatrix = load([loadpath,'/',dataname,'/',dataname,'_dataset.mat']);

%%data = originmatrix.abaloneInputs';
data = originmatrix.X;
%%data = originmatrix.data;
%%data = double(data);

[sample,dimension]=size(data);
data = data(:,:);

ratio = [0.1:0.1:0.9];

for iter =1:length(ratio)
    missingindex = generateabsentmatrix(data,ratio(iter));
    absentmatrix = nanfilling(data,missingindex);
    
    save([loadpath,'/',dataname,'/',dataname,'_missing_',num2str(ratio(iter)*100),'.mat'],'absentmatrix')
end