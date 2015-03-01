function[]=test()
vid=videoReader('Z:\test1.avi');
nFrames=vid.NumberOfFrames;
vidw=vid.Width;
vidh=vid.Height;
mov(1:nFrames) = struct('cdata',zeros(vidh,vidw,3,'uint8'),'colormap',[]);
for i=1:nFrames
    mov(k).cdata=read(vid,k);
end
disp(nFrames);
end