function [Alog]=Alog_rewrite(path_cell,counter)
    Alog=ones(4,4);
    try
         Alog(path_cell{1,counter-1}(end,1), path_cell{1,counter-1}(end,2))=0;
    end
    try
         Alog(path_cell{1,counter-2}(end,1), path_cell{1,counter-2}(end,2))=1;
    end
    
    for i=1:length(path_cell{1,counter})
         Alog(path_cell{1,counter}(i,1), path_cell{1,counter}(i,2))=0;       
    end
    
end

