function out=hardlimit(in)
% Hard limit function
% out = 0 if in<0
% out = 1 if in>=0
for i=1:numel(in)
    if in(i,1)<0
        out(i,1)=0;
    else
        out(i,1)=1;
    end
end