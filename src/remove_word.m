function [test] = remove_word(word,index)
global data_cell
for i=2:index+1
    temp=(data_cell{i});
    test=cellstr(temp);
    test2=cellstr(word);
    index_a=find(strcmp(test2,test));
    if index_a==1
        temp=temp(index_a+1:end,:);
    elseif index_a==length(temp)
        temp=temp(1:index_a-1,:);
    else
        first_half=temp(1:index_a-1,:);
        last_half=temp(index_a+1:end,:);
        temp=[first_half;last_half];
    end
    data_cell{i}=temp;
end
end

