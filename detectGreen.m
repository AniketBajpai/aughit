function[Gbw]=detectGreen(im)
gray=rgb2gray(im);
%figure,imshow(gray);
G=im(:,:,2);
Gsub=imsubtract(G,gray);
Gthresh=graythresh(Gsub);
Gbw=im2bw(Gsub,Gthresh);

    
