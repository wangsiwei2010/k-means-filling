function [labels,goal] = nmffilling(index,data,classnumber)

condition = 1e-04;
rank = classnumber;

local_options.alg       = 'mu';
local_options.norm_h    = 0;
local_options.norm_w    = 1;    
local_options.alpha     = 2;
local_options.delta     = 0.1;
local_options.metric    = 'EUC'; % 'EUC' (default) or 'KL'  
local_options.d_alpha   = -1; % for alpha divergence
local_options.d_beta    = 0; % for beta divergence 
local_options.myeps     = 1e-04;

%NMF
Y = nmf_mu(data,rank,local_options);
W = Y.W;
H = Y.H;

t = 1;
flag = 1;
while flag==1
    Y = W*H;
    if t==1
        goal(t) = updategoalvalue(data,Y);
    else
        goal(t) = updategoalvalue(data,Y);
        if ((goal(t-1)-goal(t))/goal(t)<= condition)
            flag = 0;
        end
    end
    t = t+1;
    data = updateAbsence(data,index,Y);
end

labels = kmeans(W,rank);