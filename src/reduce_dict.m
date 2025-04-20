function [index] = reduce_dict(letter,index)
global data_cell
temp=data_cell{index};
 intermed=temp(temp(:,index)==letter,:);
 data_cell{index+1}=intermed;
end

