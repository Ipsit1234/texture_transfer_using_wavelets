function output = Ycbcr_invert(image)
output = zeros(size(image));
output(:,:,1)=298.02/256*image(:,:,3) + 408.583/256*image(:,:,2) - 222.921;
output(:,:,2)=298.02/256*image(:,:,3) - 100.291/256*image(:,:,1) -  208.120/256*image(:,:,2) +135.576;
output(:,:,3)=298.02/256*image(:,:,3) + 516.542/256*image(:,:,1) -276.836;
end