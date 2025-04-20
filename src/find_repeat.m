function [pivot_index,repeat_flag,path] = find_repeat(path,path_cell,A,index,repeat_flag)
if length(path_cell)>1
    pivot_index=[];
    path_original=path;
    for i=1:length(path_cell)-1
        test=A(path_cell{1,i}(:,1),path_cell{1,i}(:,2));
        test2=test(1,:);
        test3=A(path_original(:,1),path_original(:,2));
        test4=test3(1,:);
        test5=cellstr(test2);
        test6=cellstr(test4);
        if length(test2)==length(test4)
            if strcmp(test5{1,1},test6{1,1})
                'repeat'
                M=[];
                M2=[];
                k=[];
                repeat_flag=1;
                path=path(1:end-1,:);
                index=index-1;
                for j=1:length(path_cell)
                    k=[k;min(length(path_cell{1,j}))];
                    kmin=min([k]);
                end
                for j=1:length(path_cell)
                    Mtemp=path_cell{1,j}(1:kmin,1);
                    Mtemp2=path_cell{1,j}(1:kmin,2);
                    M=[M,Mtemp];
                    M2=[M2,Mtemp2];
                end
                [m,~]=size(M);
                unique_flag=0;
                for a=1:m
                    if length(unique(M(a,:)))>1&&length(unique(M2(a,:)))>1&&unique_flag==0
                        pivot_index=a-1;
                        unique_flag=1;
                        break
                    else
                        pivot_index=-1;
                    end
                end
            else
                pivot_index=-1;
            end           
        else
            if isempty(pivot_index)
            pivot_index=-1;
            end
        end
    end
else
    pivot_index=-1;
end

end

