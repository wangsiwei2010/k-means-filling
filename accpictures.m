clear;

loadpath = 'H:/vincent/results';
dataname = 'sensorlessdrive';   %%ovarian10-90;wine10-60;glass10-60;cancer10-50;pendigits10-50;miceprotein 10-90

ratio = [10:10:40];

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

zero(1,:) = mean(acc);
zero(2,:) = mean(nmi);
zero(3,:) = mean(fm);

y11 = acc(:,1);
y31 = acc(:,3);
y41 = acc(:,4);
y51 = acc(:,5);
y61 = acc(:,6);

ratio1 = [0.1:0.1:0.4];

plot(ratio1,y11,'r*-','LineWidth',3); hold on;
plot(ratio1,y31,'b^-','LineWidth',3); hold on;
plot(ratio1,y41,'gx-','LineWidth',3); hold on;
plot(ratio1,y51,'m>-','LineWidth',3); hold on;
plot(ratio1,y61,'co-','LineWidth',3); hold on;

grid on;

xlim([0.1,0.4]);

ylabel('ACC','fontsize',18),title('Sensorless Drive','fontsize',18);
x = legend('Ours','Knn','EM','Mean','Zero');
set(x,'fontsize',18)