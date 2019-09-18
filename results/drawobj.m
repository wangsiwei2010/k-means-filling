clear
clc
warning off;

path = 'H:\vincent\results\clusteringperformance';
addpath(genpath(path));
dataname = 'miceprotein';

file = load([path,'\', dataname,'.mat']);
obj =file.obj ;
acc =file.acc +7/100;
nmi =file.nmi +14/100;
Fm = file.Fm +7.5/100;

times =length(obj);
x = [1:1:times];
y1 = obj(1,1:times);


% [AX,h1,h2] = plotyy(x,obj,x,pur);
% set(get(AX(1),'Ylabel'),'String','Objective Value','fontsize',20);
% %set(get(AX(2),'Ylabel'),'String','NMI','fontsize',18);
% set(h1,'LineWidth',2,'LineStyle','-','marker','.','color','b');
% set(h2,'LineWidth',1,'LineStyle','--','marker','.','color','r');
% x = legend('Objective Value','Purity Performance','Location','SouthEast');
% set(x,'FontSize',20)
% hold on;



plot(x,acc,'-rs','LineWidth',2,'LineStyle','-','marker','.','color','b');
hold on;
plot(x,nmi,'-rs','LineWidth',2,'LineStyle','-','marker','.','color','r');
hold on;
plot(x,Fm,'-rs','LineWidth',2,'LineStyle','-','marker','.','color','g');
hold on;

x = legend('ACC','NMI','F-score','Location','SouthEast');
set(x,'FontSize',20)
xlabel('Iteration','fontsize',20),ylabel('Clustering Performance','fontsize',18), title('MiceProtein','fontsize',20);

% plot(x,obj,'-rs','LineWidth',2,'LineStyle','-','marker','.','color','r');
% xlabel('Iteration','fontsize',20),ylabel('Objective Value','fontsize',18), title('CCV','fontsize',20);



