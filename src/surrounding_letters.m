function [letters,reference,Alog] = surrounding_letters(matrix,row,col,Alog,A,path_cell,path)
%find surrounding letters
loop=1;
letters=char();

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


for j=row-1:row+1
    for k=col-1:col+1
        try
            if ((j~=row&&k~=col)||(j==row&&k~=col)||(j~=row&&k==col))&&Alog(j,k)==1
                letters(loop)=matrix(j,k);
                reference{loop,1}=[j,k];
                loop=loop+1;
            end
        end
    end
end

if letters==""
    letters=-1;
    reference=-1;
end
end

