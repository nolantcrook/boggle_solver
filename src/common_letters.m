function [f] = common_letters(index)
global data_cell
temp=data_cell{index+1};
 colstring=(double(temp(:,index+1)));
n = 50;  % number of characters to report
[~, c] = sort(hist((colstring), 0:255), 'descend');
f = char(c(1:n)-1);
end

