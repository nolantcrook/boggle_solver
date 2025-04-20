function [chardatatest] = dict()
fileID=fopen('words2.txt','r');
data=textscan(fileID,'%s');

for i=1:length(data{1,1})
    lengthdata(i)=length(data{1,1}{i,1});
end
maxlength=max(lengthdata);
chardata=char(zeros(length(data{1,1}),maxlength));
for i=1:length(data{1,1})
    current_length=length(data{1,1}{i,1});
    for j=1:current_length
        chardata(i,j)=data{1,1}{i,1}(1,j);
    end
end
chardatatest=chardata;
end

