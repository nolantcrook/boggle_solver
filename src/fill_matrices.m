function [A,Alog] = fill_matrices(characters,rotate)
Alog=ones(4,4);
k=1;
for i=1:4
    for j=1:4
        A(i,j)=(characters(k));
        k=k+1;
    end
end
if rotate==0
    A=rot90(A,0);
elseif rotate==1
    A=rot90(A,3);
elseif rotate==2
    A=rot90(A,7);
elseif rotate==3
    A=rot90(A,11);
elseif rotate==4
    A=rot90(A,0);
end
%pick a starting letter (top left, then move down
end

