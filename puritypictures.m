clear;

loadpath = 'I:/vincent/results';
dataname = 'iris';   %%ovarian10-90;wine10-60;glass10-60;cancer10-50

ratio = [10:10:60];

acc = zeros(length(ratio),6);
nmi = zeros(length(ratio),6);
pur = zeros(length(ratio),6);

for m=1:length(ratio)
    data = load([loadpath,'/',dataname,'/',dataname,'_missing_',num2str(ratio(m)),'.mat']);
    data = data.res;
    acc(m,:) = data(1,:); 
    nmi(m,:) = data(2,:);
    pur(m,:) = data(3,:);
end

y11 = pur(:,1);
y31 = pur(:,3);
y41 = pur(:,4);
y51 = pur(:,5);
y61 = pur(:,6);

plot(ratio,y11,'r*-','LineWidth',3); hold on;
plot(ratio,y31,'b^-','LineWidth',3); hold on;
plot(ratio,y41,'gx-','LineWidth',3); hold on;
plot(ratio,y51,'m>-','LineWidth',3); hold on;
plot(ratio,y61,'co-','LineWidth',3); hold on;

xlabel('sample number pf each class'),ylabel('PURITY');
legend('Ours','Knn','EM','Mean','Zero');