function [next_letter,Alog,newrow,newcol,found]=find_next_letter(letters,f,Alog,reference,path_cell,path,A)
flag=0;
[~,n]=size(path_cell);
for i=1:n
    if length(path_cell{1,i})>length(path)
        test=cellstr(diag(A(path_cell{1,i}(:,1),path_cell{1,i}(:,2)))');   
        test2=cellstr((diag(A([path(:,1)],[path(:,2)])))');
        if strcmp(test{1}(1:end-1),test2{1})
            Alog(path_cell{1,i}(end,1),path_cell{1,i}(end,2))=0;
        end
    end
end

for i=1:length(f)
    for j=1:length(letters)
        if f(i)==letters(j)&&flag==0
            next_letter=f(i);
            newrow=reference{j,1}(1,1);
            newcol=reference{j,1}(1,2);
            Alog(newrow,newcol)=0;
            flag=1;
            break
        end
    end
end
found=flag;
if flag==0
    next_letter=[];
    newrow=[];
    newcol=[];
end
end

