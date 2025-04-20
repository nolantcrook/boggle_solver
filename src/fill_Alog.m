function [Alog] = fill_Alog(path)
Alog=ones(4,4);
for i=1:length(path)
   Alog(path(i,1),path(i,2))=0;
end

