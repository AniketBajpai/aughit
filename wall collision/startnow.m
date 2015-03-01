function[]=startnow(arduino)
%Serial Communication with Arduino Setup
%arduino=serial('COM17','BaudRate',9600);
[m , angle]  = readVid();
%disp(m);
%disp(angle);
inp=(1000*m)+angle;
inp=uint8(inp);
%disp(inp);
%inp=int32(fix(inp));
%fprintf(arduino,'%d',m,'async');
%fprintf(arduino,'%d',angle);
A=[m angle];
fprintf(arduino,'%.2f %.2f',A);
%disp(sprintf('%.2f %.2f',A));