function[Rbw]=detectRed(im)
gray=rgb2gray(im);
%figure,imshow(gray);
R=im(:,:,1);
Rsub=imsubtract(R,gray);
Rthresh=graythresh(Rsub);
Rbw=im2bw(Rsub,Rthresh);

    
