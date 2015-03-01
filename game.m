function [i2] = game(scale)
i=imread('background.jpg');
pause on;
vid = videoinput('winvideo', 2, 'MJPG_320x176');
vid.FramesPerTrigger = 1;

green=uint8([0,255,0]);
red=uint8([255,0,0]);
blue=uint8([0,0,255]);

circle=vision.ShapeInserter('Shape','Circles','Fill',true,'FillColor','Custom','CustomFillColor',green);
rect=vision.ShapeInserter('Shape','Rectangles','Fill',true,'FillColor','Custom','CustomFillColor',red);
block=vision.ShapeInserter('Shape','Rectangles','Fill',true,'FillColor','Custom','CustomFillColor',blue);

blocks=[40,100,80,30;200,100,80,30;350,100,80,30];
n=3;

x=50;
y=350;
v=5;
dir=280;
vx=v*cosd(dir);
vy=v*sind(dir);
rad=15;
count=0;

while(n~=0)
    x=x+vx;
    y=y+vy;
    if(vx>0)
        % fprintf(arduino,'%s','1');
    else
%         fprintf(arduino,'%s','3');
    end
    if(x>=500-rad)
        x=500-rad;
        vx=-vx;
 %        fprintf(arduino,'%s','2');
    else if(x<=rad)
            x=rad;
            vx=-vx;
  %           fprintf(arduino,'%s','2');
        end
    end
    if(y>=500-rad)
        y=500-rad;
        vy=-vy;
    else if(y<=rad)
            y=rad;
            vy=-vy;
        end
    end
    [s]=startnow(vid);
    paddleX=500*s;
    if(paddleX<=40)
        paddleX=40;
    else if(paddleX>=460)
            paddleX=460;
        end
    end
    ball=int32([x,y,rad]);    
    i1=step(circle,i,ball);    
    paddle=int32([paddleX-40,450,80,30]);
    i2=step(rect,i1,paddle);
    bl=int32(blocks);
    i2=step(block,i2,bl);
    imshow(i2);
    
    i2=im2bw(i2,graythresh(0.01));
    [l,num]=bwlabel(i2);
    stats=regionprops(l,'Area','Centroid');
    if(num==n+1)        
        [r,c,t]=size(stats);
        cx=stats(1,1).Centroid(1,1);
        cy=stats(1,1).Centroid(1,2);
        maxArea=stats(1,1).Area;
        pos=1;
        for(j=2:r)
            if(stats(j,1).Area>maxArea)
                cx=stats(j,1).Centroid(1,1);
                cy=stats(j,1).Centroid(1,2);
                maxArea=stats(j,1).Area;
                pos=j;
            end
        end
        
         if(cy>350)
             vy=-vy;
             y=y+vy;
             if(x<paddleX-40||x>paddleX+40)
                 vx=-vx;
                 x=x+vx;
             end
         else
             for j=1:n
                 if(blocks(j,3)~=0)
                    mpos=j;
                    min=abs(stats(pos,1).Centroid(1)-(blocks(j,1)+blocks(j,3)/2))+abs(stats(pos,1).Centroid(2)-(blocks(j,2)+blocks(j,4)/2));
                    break
                 end
             end
             for(j=j:n)
                 dist=abs(stats(pos,1).Centroid(1)-(blocks(j,1)+blocks(j,3)/2))+abs(stats(pos,1).Centroid(2)-(blocks(j,2)+blocks(j,4)/2));
                 if(dist<min)
                     mpos=j;
                     min=dist;
                 end
             end
              if(x<blocks(mpos,1)||x>blocks(mpos,3))
                  vx=-vx;
              end
              if(y<blocks(mpos,2)||y>blocks(mpos,4))
                  vy=-vy;
              end
%               blocks(mpos,3)=0;
%               blocks(mpos,4)=0;
%               n=n-1;
         end
    end
    pause(0.01);
end
count=0;
%while(count~=10)
%     ball=int32([x,y,rad]);    
%     i1=step(circle,i,ball);    
%     paddle=int32([paddleX-40,450,80,30]);
%     i2=step(rect,i1,paddle);
%     bl=int32(blocks);
%     i2=step(block,i2,bl);
%     imshow(i2);
%     count=count+1;
%end
end
