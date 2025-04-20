function [locations] = find_locations(box,matrix)

x=box(1);
y=box(2);
divisionx=x/3;
divisiony=y/3;
iterations = size(matrix);

for i=1:iterations(1)
        locations{i}=[(matrix(i,1)-1)*divisionx,(matrix(i,2)-1)*divisiony];
end
end

