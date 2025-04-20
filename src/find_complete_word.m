function [bool] = find_complete_word(index,path,A)
global data_cell
global words_found


flag=0;


if index>1
    temp=(data_cell{index+1});
    colstring=(double(temp(:,index+1)));
    bool=any(colstring==0);
    
    if bool==true
    [m,~]=size(words_found);
    if m>1
        for i=1:m-1
            test=cellstr(words_found(i,:));
            word=cellstr((diag(A([path(:,1)],[path(:,2)])))');
            flag=strcmp(test,word);
            if flag==1
                bool=false;
                break
            end
        end
    end
    end
    
    if bool==true
        index_a=find(colstring==0);
        words_found=[words_found;temp(index_a,:)];
        temp(index_a,:)
        %word=temp(index_a,:);
        %[~] = remove_word(word,index);
        %         for i=1:size(words_found)
        %             words_found(i,:)
        %         end
    end
else
    bool=false;
end

end

