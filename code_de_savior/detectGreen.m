function[bw]=detectGreen(im)
%image=imread('try.png');
[height, width, dim] = size(im);
min=30;
max=80;
res=zeros(height, width);
for i=1:1:height
for j=1:1:width
    r=im(i,j,1);
    g=im(i,j,2);
    b=im(i,j,3);
    if (r<30 && b<30 && g>30)          
        res(i,j)=255;
    else
        res(i,j)=0;
    end
end
end
%imshow(res)
bw= bwareaopen(res, 20);
%figure,imshow(bw);