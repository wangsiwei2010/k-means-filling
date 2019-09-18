clear;

loadpath = 'H:/vincent/results';
dataname = 'pendigits';   %%ovarian10-90;wine10-60;glass10-60;cancer10-50

ratio = [10:10:50];

acc = zeros(length(ratio),6);
nmi = zeros(length(ratio),6);
fm = zeros(length(ratio),6);
adj = zeros(length(ratio),6);

for m=1:length(ratio)
    data = load([loadpath,'/',dataname,'/',dataname,'_missing_',num2str(ratio(m)),'.mat']);
    data = data.res;
    acc(m,:) = data(1,:); 
    nmi(m,:) = data(2,:);
    fm(m,:) = data(3,:);
    adj(m,:) = data(4,:);
end

ratio1 = [0.1:0.1:0.5];

y11 = fm(:,1);
y31 = fm(:,3);
y41 = fm(:,4);
y51 = fm(:,5);
y61 = fm(:,6);

plot(ratio1,y41,'r*-','LineWidth',3); hold on;
plot(ratio1,y31,'b^-','LineWidth',3); hold on;
plot(ratio1,y11,'gx-','LineWidth',3); hold on;
plot(ratio1,y51,'m>-','LineWidth',3); hold on;
plot(ratio1,y61,'co-','LineWidth',3); hold on;

grid on;
xlim([0.1,0.5]);

ylabel('F-score','fontsize',18),title('PenDigits','fontsize',18);
x = legend('Ours','Knn','EM','Mean','Zero');
set(x,'fontsize',18)