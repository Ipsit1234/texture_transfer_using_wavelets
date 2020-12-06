function [image1]= myHM(image1,image2)
for i=1:size(image1,3)
    [pdf1]=imhist(image1(:,:,i),256);
    [pdf2]=imhist(image2(:,:,i),256);
    cdf1=cumsum(pdf1)/max(cumsum(pdf1));
    cdf2=cumsum(pdf2)/max(cumsum(pdf2));
    [z,y]=min(abs(repmat(cdf1,1,256)-repmat(cdf2',256,1)),[],2);
    image1(:,:,i)=(y(double(image1(:,:,i))+1));
    [pdf1]=imhist(reshape(image1(:,:,i),size(image1,1),size(image1,2)),256);
    cdf1=cumsum(pdf1)/max(cumsum(pdf1));
end
end