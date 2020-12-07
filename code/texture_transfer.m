function [combined_img] = texture_transfer(source, texture, depth, t, color_transfer)
% source  - source image, 
% texture - texture image
% depth - no. of levels of 2d DWT decomposition
% t - attenuation coefficient of texture wavelet coefficients
% color_transfer - ==1 if want to transfer color too along with texture, 0
% otherwise
[numrows numcols numberOfColorChannelsA] = size(source);

texture = imresize(texture,[numrows numcols]);                       % Resizing texture to same size of image

source_ycbcr = Ycbcr(source);                                        % To convert RGB to YCbCr
source_v = source_ycbcr(:,:,3);
source_v_dwt = wavecdf97(source_v, depth);                           % 2d DWT of Y-channel of source

texture_ycbcr = Ycbcr(texture);                                      % To convert RGB to YCbCr
texture_v = texture_ycbcr(:,:,3);
texture_v_dwt = wavecdf97(texture_v, depth);                         % 2d DWT of Y-channel of texture

combined_v_dwt = zeros(size(texture_v_dwt));

for i=1:size(combined_v_dwt,1)
    for j=1:size(combined_v_dwt,2)
        if (i <= size(combined_v_dwt,1) / (2^depth)) & (j <= size(combined_v_dwt,2) / (2^depth))
            combined_v_dwt(i,j) = source_v_dwt(i,j);                  % If coefficient of approximation filter, set as source coefficient
        else
            if(abs(source_v_dwt(i,j))>t*abs(texture_v_dwt(i,j)))      % If coefficient of detail filter of source > t*coefficient of detail filter of texture,set as source coefficient 
                combined_v_dwt(i,j) = source_v_dwt(i,j);
            else                                                      %Else set as texture coefficient
                combined_v_dwt(i,j) = texture_v_dwt(i,j);                
            end
        end
    end
end

combined_v = wavecdf97(combined_v_dwt, -1 * depth);                   % Compute inverse 2d-DWT of fusion coefficients
combined_ycbcr = zeros(size(source_ycbcr));
combined_ycbcr(:,:,1) = source_ycbcr(:,:,1);                           % Copy source Cr and Cb channel
combined_ycbcr(:,:,2) = source_ycbcr(:,:,2);
combined_ycbcr(:,:,3) = combined_v;
combined_img = Ycbcr_invert(combined_ycbcr);                           % Convert back from Ycrcb to RGB
combined_img = uint8(255 * mat2gray(combined_img));
if(color_transfer==1)
    combined_img=myHM(combined_img, texture);                          % If want to transfer color as well
else
    combined_img=myHM(combined_img, source);                           % If want to preserve colors
end

figure();
subplot(1,3,1), imshow(source), title('Source Image');
axis on;
axis tight;
daspect([1 1 1]);
subplot(1,3,2), imshow(texture), title('Texture Image');
axis on;
axis tight;
daspect([1 1 1]);
impixelinfo;

subplot(1,3,3), 
imshow(mat2gray(combined_img)); title('Fusion Image');
axis on;
axis tight;
daspect([1 1 1]);

