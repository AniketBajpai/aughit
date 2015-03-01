function[move]=readVid()
vid=VideoReader('G:\sim\d.avi');
nFrames=vid.NumberOfFrames;
vidHeight=vid.Height;
vidWidth=vid.Width;
mov(1:nFrames)=struct('cdata',zeros(vidHeight,vidWidth,3,'uint8'),'colormap',[]);
for k=1:nFrames
    mov(k).cdata=read(vid,k);
end
[r, c, t]=size(mov(1).cdata);
%imshow(mov(nFrames-60).cdata);
%figure, imshow(mov(nFrames-30).cdata);
ballPosOne=detectGreen(mov(nFrames-10).cdata);
ballPosTwo=detectGreen(mov(nFrames-5).cdata);
ballStatsOne=regionprops(ballPosOne,'Centroid');
ballStatsTwo=regionprops(ballPosTwo,'Centroid');
x1=ballStatsOne.Centroid(1);
y1=ballStatsOne.Centroid(2);
x2=ballStatsTwo.Centroid(1);
y2=ballStatsTwo.Centroid(2);
x=x2-x1;
y=y2-y1;
slope=((1.0*y)/(1.0*x));
bot=detectRed(mov(2).cdata);
botStats=regionprops(bot,'Centroid');
botx=botStats.Centroid(1);
boty=botStats.Centroid(2);
disp(slope);
botPos=((boty-y1)/slope)+x1;
if botPos<0
    botPos=botPos*(-1);
end
rem=mod(botPos,c);
n=floor(botPos/c);
if(mod(n,2)==1)
    rem=c-rem;
end
disp(rem);
%inf=fopen('Z:\input.txt','w');

%fprintf(inf,'%f ',rem);
%fprintf(inf,'%f\n',1.0);
%fclose(inf);

move=rem-botx;
disp(move);
end
    
    