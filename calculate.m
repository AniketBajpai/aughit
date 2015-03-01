function[scale]=calculate(vid)
%vid = videoinput('winvideo', 2, 'MJPG_320x176');
%vid.FramesPerTrigger = 1;
%vid.FramesPerSecond = 30;
%count=0;
%while count<=5000
    im=getsnapshot(vid);
    Rbw=detectRed(im);
    %imshow(Rbw);
    %count=count+1;
    [l, b, h]=size(Rbw);
    stats=regionprops(Rbw,'Centroid');
    x=stats.Centroid(1);
    scale=x/b;
    %disp(x/b);
    %game(x/b);
%end
