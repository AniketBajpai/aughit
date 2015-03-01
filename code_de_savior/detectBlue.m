function[objs, nobjs]=detectBlue(im)
gray=rgb2gray(im);
%figure,imshow(gray);
B=im(:,:,3);
Bsub=imsubtract(B,gray);
Bthresh=graythresh(Bsub);
Bbw=im2bw(Bsub,Bthresh);
[objs, nobjs]=bwlabel(Bbw);
    
