clear
clc
warning off;

path = 'I:/vincent/objvalue';
addpath(genpath(path));
dataname = 'sensorlessdrive';

file = load([path,'/', dataname,'obj.mat']);
obj =file.obj;
times =length(obj);
x = [1:1:times];
y1 = obj(1,1:times);


plot(x,y1,'ro-','MarkerSize',10);
hold on;
grid on;

xlabel('Iteration Times','fontsize',16),ylabel('Objective','fontsize',16),title('Sensorless Drive','fontsize',16);
