function [C,GMN] =  kmeans( train, K )
    N = size(train,1);
    D = size(train,2);
    DM = zeros(N,K);
    GM = ones(N,K);
    GMN = zeros(N,K);
    
    %Initialisation: Randomly select K data points as mean
    ind = randperm(N);
    C = train(ind(1:K),:);
    
    while(~isequaln(GM,GMN))        
        GM = GMN;
        GMN = zeros(N,K);
        
        for i=1:K
            diff_mat = train - repmat(C(i,:),N,1);
            
            for j=1:N
             DM(j,i) = norm(diff_mat(j,:));
            end
            
        end
        
        for i=1:N
            [~,idx] = min(DM(i,:));
            GMN(i,idx) = 1;
        end
        
        for i=1:K
            temp = train .* repmat(GMN(:,i),1,D);
            C(i,:) = sum(temp,1)./sum(GMN(:,i),1);
        end
    end
end

