function upload(imagename) %read image and change it to 2d (or grayscale)%
im=imread('imagename'); %imread to upload image
imshow(im);
im=rgb2gray(im);
end 

function pickStructElement(type,sizeInPixels) %pickStructuringElement and goes on
 se=strel('type',15);
%create disk shaped structuring element with radius of 15 pixels.
 background = imopen(im,se); 
 %to get the background of the image perform opening 
 im2 = im - background;%remove background from the image 
figure(2);
imshow(im2); %shows image 

im3 = imadjust(im2); %adjusts contrast
figure (3) 
imshow(im3)

end 
function IdontreallyknowWhy(size)
bw = imbinarize(im3); %make im3 a binary image 
bw = bwareaopen(bw, size); %removes all connected components (objects)
%that have fewer than P pixels from the binary image BW,

figure(4)
imshow(bw)
end 

function cc(size)
cc = bwconncomp(bw, size);
%CC = bwconncomp(BW,conn) returns the connected components where conn
%specifies the desired connectivity (4,8) for the connected components.


grain = false(size(bw)); %false logical 0- change everything to 0 in size of image 

grain(cc.PixelIdxList{10}) = true; %change only the 50th connected item to 1
utsu=grain;
figure (5) 
imshow(grain);
end 

%L = labelmatrix(cc);%creates a label matrix from the connected components 
                    %structure CC returned by bwconncomp.








