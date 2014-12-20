function main
    Karr = [3,8,15];
    output = {'K3.jpg','K8.jpg','K15.jpg'};
    for i=1:size(Karr,2)
      fprintf('Generating image with K=%d \n', Karr(i)); 
      FI = vectorquantize( 'image.jpg', Karr(i) );
      imwrite(uint8(FI),output{i});
      fprintf('Generated image with K=%d \n', Karr(i));
    end
end