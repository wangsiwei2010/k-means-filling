function [U,labels_u,obj] = kmeansfilling(data, K,index,times)

s = RandStream('mt19937ar','seed','shuffle');
RandStream.setGlobalStream(s);

[N, d] = size(data);

datamatrix = data;

% init U
sampleIds = randsample(1:N, K,false);
U = datamatrix(sampleIds, :);
labels_u = zeros(N, 1);

maxiter = 100;
eps = 1e-4;
iter = 1;
flag = 1;

while flag
    
    for i = 1:N
        x = datamatrix(i, :);
        % check label
        label = 0;
        dist = 0;
        for j = 1:K
            tmp_dist = sum((x-U(j, :)).^2);
            if label == 0 || tmp_dist < dist
                label = j;
                dist = tmp_dist;
            end
        end
        labels_u(i) = label;
    end
    
    %update U
    new_U = zeros(K, d);
    labels_count = zeros(K, 1);
    for i = 1:N
        label = labels_u(i);
        new_U(label, :) = new_U(label, :) + datamatrix(i, :);
        labels_count(label) = labels_count(label) + 1;
    end
    for i = 1:K
        new_U(i, :) = new_U(i, :)/labels_count(i);
    end
    U = new_U;
    
    %update data
    [datamatrix] = updatefilling(datamatrix,U,labels_u,index);

    E_in = 0;
    for i = 1:N
        x = datamatrix(i, :);
        label = labels_u(i);
        u = U(label, :);
        E_in = E_in + norm(x-u);
    end
    obj(iter) = E_in;
    
    
    if ((iter>=2) && ((obj(iter-1)-obj(iter))/obj(iter) <= eps)) || (iter == maxiter)
        flag = 0;
    end
    iter = iter + 1;
end
end

