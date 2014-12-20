function [FI] = vectorquantize( image, K )
    A = imread(image,'jpg');
    M = size(A,1);
    N = size(A,2);
    X = reshape(A,M*N,size(A,3));
    Y = permute(reshape(X,M,N,[]),[1 2 3]);
    equal = isequaln(A,Y);
    [C, G] = kmeans(double(X),K);
    FM = zeros(size(X));
    for i=1:K
        temp = repmat(C(i,:),size(X,1),1) .* repmat(G(:,i),1,3);
        FM = FM + temp;
    end
    FI = permute(reshape(FM,M,N,[]),[1 2 3]);
end

