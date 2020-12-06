function output = Ycbcr(image)
output = zeros(size(image));
output(:,:,3) = 16 + 65.481*double(image(:,:,1)) / 255.0 + 128.553*double(image(:,:,2)) / 255.0 + 24.966*double(image(:,:,3)) / 255.0;
output(:,:,1) = 128 + - 37.79*double(image(:,:,1)) / 255.0 + -74.203*double(image(:,:,2)) / 255.0 + 112*double(image(:,:,3)) / 255.0;
output(:,:,2) = 128 + 112*double(image(:,:,1)) / 255.0 + -93.786*double(image(:,:,2)) / 255.0 + -18.214*double(image(:,:,3)) / 255.0;
end