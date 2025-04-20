clc
clear all
close all

import java.awt.Robot;
import java.awt.event.*;
mouse = Robot;
global data_cell
global words_found
words_found=[];
[data]= dict();
data_cell{1}=data;

letters=upper("nolsnxeecibeagrs");
characters=convertStringsToChars(letters);
path=zeros(1,2);
%load the characters into an array and create an array to mark which are
%used
[A,Alog] = fill_matrices(characters);
"enter top left"
pause();
topleft=get(0,'PointerLocation');
"got top left"
"enter top right"
pause();
topright=get(0,'PointerLocation');
"got top right"
"enter bottom left"
pause();
bottomleft=get(0,'PointerLocation');
"got bottom left"
"enter bottom right"
pause();
bottomright=get(0,'PointerLocation');
"got bottom right"
%y,x
box=[mean(topright(1)-topleft(1),bottomright(1)-bottomleft(1)),mean(topright(2)-bottomright(2),topleft(2)-bottomleft(2))];
path2=[topleft;topright;bottomleft;bottomright];

index=1;
bool=false;
for aa=1:4
    for bb=1:4
        loop=true;
        %%this is for beginning each new letter, this should only run 16 times
        current_start_point=A(aa,bb);%find the letter that's the current start point
        Alog(aa,bb)=0;%disqualify the letter from searching
        if index==1
            next_letter=current_start_point;
            path=[aa,bb];
        end
        while(loop==true)
            %%%%%%%%%%%%%%%create a loop here for continuining on
            [~] = reduce_dict(next_letter,index);%reduce the possible words in the dictionary that start with next letter
            [bool] = find_complete_word(index);%find if the current list contains a word
                if bool==true&&index>1%if there is a "0" in the next index, then trace out the word
                    [locations] = find_locations(box,path);
                    move(locations,topleft,path);
                end
            [f] = common_letters(index);%find the most common next letters from remaining words in dictionary
            [letters,reference] = surrounding_letters(A,path(index,1),path(index,2),Alog);%find the surrounding letters that haven't been used and their indices
            %trace out all the surrounding letters
            
            [next_letter,Alog,newrow,newcol,found]=find_next_letter(letters,f,Alog,reference);%find the first most common letter in the surrounding letters
            if found==1
                path=[path;[newrow,newcol]];
                 %append path to path variable
                index=index+1;
            else
                error_path=path;
                counter=1;
                while found==0
                    %backup to the last fork in the tree
                    %data=last_dict;
                    if counter>1
                        Alog(error_path(index+1,1),error_path(index+1,2))=1;
                    end
                    
                    path=path(1:end-1,:);
                    index=index-1;
                    [f] = common_letters(index);
                    if isempty(path)
                        loop=false;
                        [A,Alog] = fill_matrices(characters);
                        break
                    end
                    [letters,reference] = surrounding_letters(A,path(index,1),path(index,2),Alog);%find the surrounding letters that haven't been used and their indices
                    [next_letter,Alog,newrow,newcol,found]=find_next_letter(letters,f,Alog,reference);%find the first most common letter in the surrounding letters
                    counter=counter+1;
                end
                path=[path;[newrow,newcol]];%append path to path variable
                index=index+1;
            end
            
        end
    end
end




